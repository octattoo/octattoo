import 'dart:typed_data';

/// Abstract interface for S3-compatible object storage.
/// Injected into endpoints for testability.
abstract class ObjectStorageClient {
  /// Uploads bytes to the given key. Returns the public URL.
  Future<String> putObject({
    required String key,
    required Uint8List bytes,
    required String contentType,
  });

  /// Deletes the object at the given key.
  Future<void> deleteObject(String key);

  /// Deletes all objects with the given prefix.
  Future<void> deleteByPrefix(String prefix);

  /// Returns a URL for the object at the given key.
  String getObjectUrl(String key);

  /// Checks if an object exists at the given key.
  Future<bool> objectExists(String key);
}
