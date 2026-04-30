import 'package:test/test.dart';
import 'package:octattoo_server/src/generated/protocol.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Material CRUD', (sessionBuilder, endpoints) {
    final authUserId1 = '550e8400-e29b-41d4-a716-446655440001';
    final authUserId2 = '550e8400-e29b-41d4-a716-446655440002';

    late TestSessionBuilder session1;
    late TestSessionBuilder session2;

    setUp(() {
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

    test('creates an ink material and returns it', () async {
      await endpoints.artistProfile.createProfile(session1, 'A', 'artist_a');

      final material = await endpoints.material.createMaterial(
        session1,
        type: MaterialType.ink,
        manufacturer: 'World Famous',
        supplier: 'Ink Supply Co',
        productName: 'True Black',
        batchNumber: 'WF-2026-001',
        expirationDate: DateTime(2027, 6, 1),
      );

      expect(material.id, isNotNull);
      expect(material.productName, 'True Black');
      expect(material.type, MaterialType.ink);
      expect(material.status, MaterialStatus.inStock);
      expect(material.quantity, isNull);
    });

    test('creates a needle material with quantity', () async {
      await endpoints.artistProfile.createProfile(session1, 'A', 'artist_a');

      final material = await endpoints.material.createMaterial(
        session1,
        type: MaterialType.needle,
        manufacturer: 'Cheyenne',
        supplier: 'Needle Depot',
        productName: 'Hawk Pen 0.30mm',
        batchNumber: 'CH-2026-042',
        expirationDate: DateTime(2028, 1, 1),
        quantity: 20,
      );

      expect(material.type, MaterialType.needle);
      expect(material.quantity, 20);
      expect(material.status, MaterialStatus.inStock);
    });

    test('rejects ink with quantity', () async {
      await endpoints.artistProfile.createProfile(session1, 'A', 'artist_a');

      expect(
        () => endpoints.material.createMaterial(
          session1,
          type: MaterialType.ink,
          manufacturer: 'M',
          supplier: 'S',
          productName: 'P',
          batchNumber: 'B',
          expirationDate: DateTime(2027, 1, 1),
          quantity: 5,
        ),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('rejects needle without quantity', () async {
      await endpoints.artistProfile.createProfile(session1, 'A', 'artist_a');

      expect(
        () => endpoints.material.createMaterial(
          session1,
          type: MaterialType.needle,
          manufacturer: 'M',
          supplier: 'S',
          productName: 'P',
          batchNumber: 'B',
          expirationDate: DateTime(2027, 1, 1),
        ),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('lists materials for current profile', () async {
      await endpoints.artistProfile.createProfile(session1, 'A', 'artist_a');

      await endpoints.material.createMaterial(
        session1,
        type: MaterialType.ink,
        manufacturer: 'World Famous',
        supplier: 'S',
        productName: 'Lining Black',
        batchNumber: 'WF-001',
        expirationDate: DateTime(2027, 1, 1),
      );

      final list = await endpoints.material.listMaterials(session1);
      expect(list.any((m) => m.productName == 'Lining Black'), isTrue);
    });

    test('filters materials by type', () async {
      await endpoints.artistProfile.createProfile(session1, 'A', 'artist_a');

      await endpoints.material.createMaterial(
        session1,
        type: MaterialType.ink,
        manufacturer: 'M',
        supplier: 'S',
        productName: 'Ink Only',
        batchNumber: 'B1',
        expirationDate: DateTime(2027, 1, 1),
      );
      await endpoints.material.createMaterial(
        session1,
        type: MaterialType.needle,
        manufacturer: 'M',
        supplier: 'S',
        productName: 'Needle Only',
        batchNumber: 'B2',
        expirationDate: DateTime(2027, 1, 1),
        quantity: 10,
      );

      final inks = await endpoints.material.listMaterials(
        session1,
        type: MaterialType.ink,
      );
      expect(inks.every((m) => m.type == MaterialType.ink), isTrue);
      expect(inks.any((m) => m.productName == 'Ink Only'), isTrue);

      final needles = await endpoints.material.listMaterials(
        session1,
        type: MaterialType.needle,
      );
      expect(needles.every((m) => m.type == MaterialType.needle), isTrue);
    });

    test('search filters by productName', () async {
      await endpoints.artistProfile.createProfile(session1, 'A', 'artist_a');

      await endpoints.material.createMaterial(
        session1,
        type: MaterialType.ink,
        manufacturer: 'World Famous',
        supplier: 'S',
        productName: 'Unique Crimson',
        batchNumber: 'B1',
        expirationDate: DateTime(2027, 1, 1),
      );

      final results = await endpoints.material.listMaterials(
        session1,
        search: 'Crimson',
      );
      expect(results, hasLength(1));
      expect(results.first.productName, 'Unique Crimson');
    });

    test('toggleInkStatus flips inStock to empty and back', () async {
      await endpoints.artistProfile.createProfile(session1, 'A', 'artist_a');

      final created = await endpoints.material.createMaterial(
        session1,
        type: MaterialType.ink,
        manufacturer: 'M',
        supplier: 'S',
        productName: 'Toggle Test',
        batchNumber: 'B1',
        expirationDate: DateTime(2027, 1, 1),
      );

      final toggled = await endpoints.material.toggleInkStatus(
        session1,
        created.id!,
      );
      expect(toggled!.status, MaterialStatus.empty);

      final toggledBack = await endpoints.material.toggleInkStatus(
        session1,
        created.id!,
      );
      expect(toggledBack!.status, MaterialStatus.inStock);
    });

    test('toggleInkStatus rejects needle material', () async {
      await endpoints.artistProfile.createProfile(session1, 'A', 'artist_a');

      final needle = await endpoints.material.createMaterial(
        session1,
        type: MaterialType.needle,
        manufacturer: 'M',
        supplier: 'S',
        productName: 'N',
        batchNumber: 'B1',
        expirationDate: DateTime(2027, 1, 1),
        quantity: 5,
      );

      expect(
        () => endpoints.material.toggleInkStatus(session1, needle.id!),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('setNeedleQuantity to 0 auto-marks empty', () async {
      await endpoints.artistProfile.createProfile(session1, 'A', 'artist_a');

      final needle = await endpoints.material.createMaterial(
        session1,
        type: MaterialType.needle,
        manufacturer: 'M',
        supplier: 'S',
        productName: 'Quantity Test',
        batchNumber: 'B1',
        expirationDate: DateTime(2027, 1, 1),
        quantity: 5,
      );

      final updated = await endpoints.material.setNeedleQuantity(
        session1,
        materialId: needle.id!,
        quantity: 0,
      );

      expect(updated!.quantity, 0);
      expect(updated.status, MaterialStatus.empty);
    });

    test('setNeedleQuantity back to positive restores inStock', () async {
      await endpoints.artistProfile.createProfile(session1, 'A', 'artist_a');

      final needle = await endpoints.material.createMaterial(
        session1,
        type: MaterialType.needle,
        manufacturer: 'M',
        supplier: 'S',
        productName: 'Restore Test',
        batchNumber: 'B1',
        expirationDate: DateTime(2027, 1, 1),
        quantity: 5,
      );

      await endpoints.material.setNeedleQuantity(
        session1,
        materialId: needle.id!,
        quantity: 0,
      );

      final restored = await endpoints.material.setNeedleQuantity(
        session1,
        materialId: needle.id!,
        quantity: 10,
      );

      expect(restored!.status, MaterialStatus.inStock);
      expect(restored.quantity, 10);
    });

    test('updates a material', () async {
      await endpoints.artistProfile.createProfile(session1, 'A', 'artist_a');

      final created = await endpoints.material.createMaterial(
        session1,
        type: MaterialType.ink,
        manufacturer: 'Old Mfg',
        supplier: 'Old Sup',
        productName: 'Old Name',
        batchNumber: 'OLD-001',
        expirationDate: DateTime(2027, 1, 1),
      );

      final updated = await endpoints.material.updateMaterial(
        session1,
        materialId: created.id!,
        manufacturer: 'New Mfg',
        supplier: 'New Sup',
        productName: 'New Name',
        batchNumber: 'NEW-001',
        expirationDate: DateTime(2028, 6, 1),
      );

      expect(updated!.manufacturer, 'New Mfg');
      expect(updated.productName, 'New Name');
      expect(updated.batchNumber, 'NEW-001');
    });

    test('deletes a material', () async {
      await endpoints.artistProfile.createProfile(session1, 'A', 'artist_a');

      final created = await endpoints.material.createMaterial(
        session1,
        type: MaterialType.ink,
        manufacturer: 'M',
        supplier: 'S',
        productName: 'Delete Me',
        batchNumber: 'B1',
        expirationDate: DateTime(2027, 1, 1),
      );

      final deleted = await endpoints.material.deleteMaterial(
        session1,
        created.id!,
      );
      expect(deleted, isTrue);

      final fetched = await endpoints.material.getMaterial(
        session1,
        created.id!,
      );
      expect(fetched, isNull);
    });

    test('cross-profile isolation: cannot see other profile materials',
        () async {
      await endpoints.artistProfile.createProfile(session1, 'A', 'artist_a');
      await endpoints.artistProfile.createProfile(session2, 'B', 'artist_b');

      await endpoints.material.createMaterial(
        session1,
        type: MaterialType.ink,
        manufacturer: 'M',
        supplier: 'S',
        productName: 'Profile1Ink',
        batchNumber: 'B1',
        expirationDate: DateTime(2027, 1, 1),
      );

      final list = await endpoints.material.listMaterials(session2);
      expect(list.where((m) => m.productName == 'Profile1Ink'), isEmpty);
    });

    test('cross-profile isolation: cannot toggle other profile material',
        () async {
      await endpoints.artistProfile.createProfile(session1, 'A', 'artist_a');
      await endpoints.artistProfile.createProfile(session2, 'B', 'artist_b');

      final created = await endpoints.material.createMaterial(
        session1,
        type: MaterialType.ink,
        manufacturer: 'M',
        supplier: 'S',
        productName: 'Isolated',
        batchNumber: 'B1',
        expirationDate: DateTime(2027, 1, 1),
      );

      final result = await endpoints.material.toggleInkStatus(
        session2,
        created.id!,
      );
      expect(result, isNull);
    });

    test('rejects unauthenticated calls', () async {
      expect(
        () => endpoints.material.listMaterials(sessionBuilder),
        throwsA(isA<ServerpodUnauthenticatedException>()),
      );
    });
  });
}
