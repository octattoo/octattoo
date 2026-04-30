import 'dart:typed_data';

import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import 'object_storage_client.dart';

class StorageEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Test-only override for the object storage client.
  static ObjectStorageClient? objectStorageOverride;

  static const int defaultQuotaBytes = 500 * 1024 * 1024; // 500MB free tier

  ObjectStorageClient get _storage {
    if (objectStorageOverride != null) return objectStorageOverride!;
    throw StateError('No ObjectStorageClient configured');
  }

  /// Uploads a file and returns the stored file metadata.
  Future<StoredFile> uploadFile(
    Session session, {
    required String fileName,
    required String mimeType,
    required ByteData bytes,
  }) async {
    final profile = await _getArtistProfile(session);
    final artistProfileId = profile.id!;
    final fileBytes = bytes.buffer.asUint8List();
    final sizeBytes = fileBytes.length;

    // Quota enforcement
    final currentUsage = await _calculateUsage(session, artistProfileId);
    final quotaLimit = profile.storageQuotaBytes;
    if (currentUsage + sizeBytes > quotaLimit) {
      throw StorageQuotaExceededException(
        currentUsage: currentUsage,
        maxAllowed: quotaLimit,
      );
    }

    // Build storage path
    final ext = _extractExtension(fileName);
    final uuid = Uuid().v7();
    final storagePath = 'originals/$artistProfileId/$uuid.$ext';

    // Upload to object storage
    await _storage.putObject(
      key: storagePath,
      bytes: fileBytes,
      contentType: mimeType,
    );

    // Persist metadata
    return StoredFile.db.insertRow(
      session,
      StoredFile(
        artistProfileId: artistProfileId,
        fileName: fileName,
        mimeType: mimeType,
        sizeBytes: sizeBytes,
        storagePath: storagePath,
      ),
    );
  }

  /// Retrieves file metadata by ID (scoped to artist profile).
  Future<StoredFile?> getFile(Session session, UuidValue fileId) async {
    final profile = await _getArtistProfile(session);
    return _findOwnedFile(session, fileId, profile.id!);
  }

  /// Deletes a file and all its variants.
  Future<bool> deleteFile(Session session, UuidValue fileId) async {
    final profile = await _getArtistProfile(session);
    final file = await _findOwnedFile(session, fileId, profile.id!);

    if (file == null) return false;

    // Delete original from storage
    await _storage.deleteObject(file.storagePath);

    // Delete all variants (same path under variants/ prefix)
    final variantPrefix = file.storagePath.replaceFirst('originals/', 'variants/');
    await _storage.deleteByPrefix(variantPrefix);

    // Delete DB record
    await StoredFile.db.deleteRow(session, file);
    return true;
  }

  /// Returns a URL for the requested variant, generating it if needed.
  Future<String> getVariantUrl(
    Session session, {
    required UuidValue fileId,
    required String variant,
  }) async {
    final profile = await _getArtistProfile(session);
    final file = await _findOwnedFile(session, fileId, profile.id!);

    if (file == null) {
      throw StateError('File not found');
    }

    final variantKey =
        '${file.storagePath.replaceFirst('originals/', 'variants/')}_$variant';

    // Check if variant already exists
    if (!await _storage.objectExists(variantKey)) {
      // In production, this would resize/transform the image.
      // For now, store a placeholder variant.
      await _storage.putObject(
        key: variantKey,
        bytes: Uint8List(0),
        contentType: file.mimeType,
      );
    }

    return _storage.getObjectUrl(variantKey);
  }

  /// Returns total storage usage in bytes for the current profile.
  Future<int> getStorageUsage(Session session) async {
    final profile = await _getArtistProfile(session);
    return _calculateUsage(session, profile.id!);
  }

  /// Sets the storage quota for the current profile (used in tests).
  Future<void> setStorageQuota(Session session, int quotaBytes) async {
    final profile = await _getArtistProfile(session);
    profile.storageQuotaBytes = quotaBytes;
    await ArtistProfile.db.updateRow(session, profile);
  }

  Future<int> _calculateUsage(Session session, UuidValue artistProfileId) async {
    final files = await StoredFile.db.find(
      session,
      where: (t) => t.artistProfileId.equals(artistProfileId),
    );
    return files.fold<int>(0, (sum, f) => sum + f.sizeBytes);
  }

  Future<StoredFile?> _findOwnedFile(
    Session session,
    UuidValue fileId,
    UuidValue artistProfileId,
  ) {
    return StoredFile.db.findFirstRow(
      session,
      where: (t) =>
          t.id.equals(fileId) & t.artistProfileId.equals(artistProfileId),
    );
  }

  String _extractExtension(String fileName) {
    final dot = fileName.lastIndexOf('.');
    if (dot == -1 || dot == fileName.length - 1) return 'bin';
    return fileName.substring(dot + 1).toLowerCase();
  }

  Future<ArtistProfile> _getArtistProfile(Session session) async {
    final authUserId = session.authenticated!.userIdentifier;

    final profile = await ArtistProfile.db.findFirstRow(
      session,
      where: (t) => t.authUserId.equals(UuidValue.fromString(authUserId)),
    );

    if (profile == null) {
      throw StateError('No artist profile found for user');
    }

    return profile;
  }
}
