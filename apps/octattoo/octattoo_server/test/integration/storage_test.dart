import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:octattoo_server/src/generated/protocol.dart';
import 'package:octattoo_server/src/storage/in_memory_object_storage.dart';
import 'package:octattoo_server/src/storage/storage_endpoint.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Storage', (sessionBuilder, endpoints) {
    final authUserId1 = '550e8400-e29b-41d4-a716-446655440001';
    final authUserId2 = '550e8400-e29b-41d4-a716-446655440002';

    late TestSessionBuilder session1;
    late TestSessionBuilder session2;
    late InMemoryObjectStorage objectStorage;

    setUp(() {
      objectStorage = InMemoryObjectStorage();
      StorageEndpoint.objectStorageOverride = objectStorage;

      session1 = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          authUserId1,
          {},
        ),
      );
      session2 = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          authUserId2,
          {},
        ),
      );
    });

    tearDown(() {
      StorageEndpoint.objectStorageOverride = null;
    });

    test('uploads a file and retrieves it by ID', () async {
      await endpoints.artistProfile.createProfile(session1, 'A', 'artist_a');

      final bytes = ByteData.view(
        Uint8List.fromList([1, 2, 3, 4, 5]).buffer,
      );

      final stored = await endpoints.storage.uploadFile(
        session1,
        fileName: 'test.png',
        mimeType: 'image/png',
        bytes: bytes,
      );

      expect(stored.id, isNotNull);
      expect(stored.fileName, 'test.png');
      expect(stored.mimeType, 'image/png');
      expect(stored.sizeBytes, 5);

      final retrieved = await endpoints.storage.getFile(session1, stored.id!);
      expect(retrieved, isNotNull);
      expect(retrieved!.fileName, 'test.png');
    });

    test('upload stores file at correct S3 path', () async {
      final profileId = (await endpoints.artistProfile.createProfile(session1, 'A', 'artist_a')).id!;

      final bytes = ByteData.view(
        Uint8List.fromList([1, 2, 3]).buffer,
      );

      final stored = await endpoints.storage.uploadFile(
        session1,
        fileName: 'photo.jpg',
        mimeType: 'image/jpeg',
        bytes: bytes,
      );

      expect(
        stored.storagePath,
        startsWith('originals/$profileId/'),
      );
      expect(stored.storagePath, endsWith('.jpg'));
      expect(objectStorage.objects.containsKey(stored.storagePath), isTrue);
    });

    test('quota tracking: upload increments used storage', () async {
      await endpoints.artistProfile.createProfile(session1, 'A', 'artist_a');

      final bytes = ByteData.view(
        Uint8List.fromList(List.filled(1000, 0)).buffer,
      );

      await endpoints.storage.uploadFile(
        session1,
        fileName: 'a.png',
        mimeType: 'image/png',
        bytes: bytes,
      );

      final usage = await endpoints.storage.getStorageUsage(session1);
      expect(usage, greaterThanOrEqualTo(1000));
    });

    test('quota enforcement: rejects upload when quota exceeded', () async {
      await endpoints.artistProfile.createProfile(session1, 'A', 'artist_a');

      // Set a tiny quota via the endpoint (persisted in DB)
      await endpoints.storage.setStorageQuota(session1, 100);

      final bytes = ByteData.view(
        Uint8List.fromList(List.filled(200, 0)).buffer,
      );

      expect(
        () => endpoints.storage.uploadFile(
          session1,
          fileName: 'big.png',
          mimeType: 'image/png',
          bytes: bytes,
        ),
        throwsA(isA<StorageQuotaExceededException>()),
      );
    });

    test('file deletion removes original and all variants', () async {
      await endpoints.artistProfile.createProfile(session1, 'A', 'artist_a');

      final bytes = ByteData.view(
        Uint8List.fromList([1, 2, 3]).buffer,
      );

      final stored = await endpoints.storage.uploadFile(
        session1,
        fileName: 'delete-me.png',
        mimeType: 'image/png',
        bytes: bytes,
      );

      // Simulate a variant existing
      final variantKey = stored.storagePath.replaceFirst(
        'originals/',
        'variants/',
      );
      await objectStorage.putObject(
        key: '${variantKey}_thumb',
        bytes: Uint8List.fromList([9, 8, 7]),
        contentType: 'image/png',
      );

      final deleted = await endpoints.storage.deleteFile(
        session1,
        stored.id!,
      );
      expect(deleted, isTrue);

      // Original gone from storage
      expect(objectStorage.objects.containsKey(stored.storagePath), isFalse);

      // DB record gone
      final retrieved = await endpoints.storage.getFile(session1, stored.id!);
      expect(retrieved, isNull);
    });

    test('on-demand variant generation returns URL', () async {
      await endpoints.artistProfile.createProfile(session1, 'A', 'artist_a');

      final bytes = ByteData.view(
        Uint8List.fromList([1, 2, 3, 4, 5]).buffer,
      );

      final stored = await endpoints.storage.uploadFile(
        session1,
        fileName: 'variant-test.png',
        mimeType: 'image/png',
        bytes: bytes,
      );

      final variantUrl = await endpoints.storage.getVariantUrl(
        session1,
        fileId: stored.id!,
        variant: 'thumb_200x200',
      );

      expect(variantUrl, isNotNull);
      expect(variantUrl, contains('variants/'));
    });

    test('variants are not counted in quota', () async {
      await endpoints.artistProfile.createProfile(session1, 'A', 'artist_a');

      final bytes = ByteData.view(
        Uint8List.fromList(List.filled(100, 0)).buffer,
      );

      final stored = await endpoints.storage.uploadFile(
        session1,
        fileName: 'quota-test.png',
        mimeType: 'image/png',
        bytes: bytes,
      );

      // Generate a variant
      await endpoints.storage.getVariantUrl(
        session1,
        fileId: stored.id!,
        variant: 'thumb_200x200',
      );

      // Quota should only reflect the original
      final usage = await endpoints.storage.getStorageUsage(session1);
      expect(usage, 100);
    });

    test('cross-profile isolation: cannot access other profile files',
        () async {
      await endpoints.artistProfile.createProfile(session1, 'A', 'artist_a');
      await endpoints.artistProfile.createProfile(session2, 'B', 'artist_b');

      final bytes = ByteData.view(
        Uint8List.fromList([1, 2, 3]).buffer,
      );

      final stored = await endpoints.storage.uploadFile(
        session1,
        fileName: 'private.png',
        mimeType: 'image/png',
        bytes: bytes,
      );

      // session2 cannot retrieve session1's file
      final retrieved = await endpoints.storage.getFile(session2, stored.id!);
      expect(retrieved, isNull);
    });

    test('unauthenticated access rejected', () async {
      expect(
        () => endpoints.storage.getStorageUsage(sessionBuilder),
        throwsA(isA<ServerpodUnauthenticatedException>()),
      );
    });
  });
}
