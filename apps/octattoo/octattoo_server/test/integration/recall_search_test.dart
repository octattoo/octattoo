import 'package:serverpod/serverpod.dart' show UuidValue;
import 'package:test/test.dart';
import 'package:octattoo_server/src/generated/protocol.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Recall search', (sessionBuilder, endpoints) {
    final authUserId = '550e8400-e29b-41d4-a716-446655440001';
    late TestSessionBuilder session;

    setUp(() {
      session = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          authUserId,
          {},
        ),
      );
    });

    final workplaceId = UuidValue.fromString(
      'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    );

    /// Sets up two profiles under the same account, each with a customer
    /// and a finalized appointment using the same batch number.
    Future<String> setupCrossProfileScenario() async {
      const batch = 'BATCH-123';
      final dbSession = session.build();

      // Profile 1
      final profile1 = await ArtistProfile.db.insertRow(
        dbSession,
        ArtistProfile(
          authUserId: UuidValue.fromString(authUserId),
          name: 'Brand A',
          handle: 'brand_a',
        ),
      );
      final customer1 = await Customer.db.insertRow(
        dbSession,
        Customer(
          artistProfileId: profile1.id!,
          name: 'Alice',
          email: 'alice@example.com',
        ),
      );
      final mat1 = await Material.db.insertRow(
        dbSession,
        Material(
          artistProfileId: profile1.id!,
          type: MaterialType.ink,
          manufacturer: 'World Famous',
          supplier: 'Ink Co',
          productName: 'True Black',
          batchNumber: batch,
          status: MaterialStatus.inStock,
          expirationDate: DateTime(2028, 1, 1),
        ),
      );
      final appt1 = await Appointment.db.insertRow(
        dbSession,
        Appointment(
          artistProfileId: profile1.id!,
          customerId: customer1.id!,
          workplaceId: workplaceId,
          type: AppointmentType.tattoo,
          status: AppointmentStatus.finalized,
          scheduledAt: DateTime(2026, 5, 15, 14, 0),
          finalizedAt: DateTime(2026, 5, 15, 16, 0),
        ),
      );
      await AppointmentMaterial.db.insertRow(
        dbSession,
        AppointmentMaterial(
          appointmentId: appt1.id!,
          materialId: mat1.id!,
          manufacturer: 'World Famous',
          productName: 'True Black',
          batchNumber: batch,
        ),
      );

      // Profile 2
      final profile2 = await ArtistProfile.db.insertRow(
        dbSession,
        ArtistProfile(
          authUserId: UuidValue.fromString(authUserId),
          name: 'Brand B',
          handle: 'brand_b',
        ),
      );
      final customer2 = await Customer.db.insertRow(
        dbSession,
        Customer(
          artistProfileId: profile2.id!,
          name: 'Bob',
          email: 'bob@example.com',
        ),
      );
      final mat2 = await Material.db.insertRow(
        dbSession,
        Material(
          artistProfileId: profile2.id!,
          type: MaterialType.ink,
          manufacturer: 'World Famous',
          supplier: 'Ink Co',
          productName: 'True Black',
          batchNumber: batch,
          status: MaterialStatus.inStock,
          expirationDate: DateTime(2028, 1, 1),
        ),
      );
      final appt2 = await Appointment.db.insertRow(
        dbSession,
        Appointment(
          artistProfileId: profile2.id!,
          customerId: customer2.id!,
          workplaceId: workplaceId,
          type: AppointmentType.tattoo,
          status: AppointmentStatus.finalized,
          scheduledAt: DateTime(2026, 5, 20, 10, 0),
          finalizedAt: DateTime(2026, 5, 20, 12, 0),
        ),
      );
      await AppointmentMaterial.db.insertRow(
        dbSession,
        AppointmentMaterial(
          appointmentId: appt2.id!,
          materialId: mat2.id!,
          manufacturer: 'World Famous',
          productName: 'True Black',
          batchNumber: batch,
        ),
      );

      return batch;
    }

    test('returns matches for a batch number across profiles', () async {
      final batch = await setupCrossProfileScenario();

      final results = await endpoints.recall.searchByBatch(session, batch);

      expect(results, hasLength(2));
      final names = results.map((r) => r.customerName).toSet();
      expect(names, containsAll(['Alice', 'Bob']));
      final profiles = results.map((r) => r.artistProfileName).toSet();
      expect(profiles, containsAll(['Brand A', 'Brand B']));
    });

    test('privacy: different account same batch sees no leakage', () async {
      final batch = await setupCrossProfileScenario();
      final dbSession = session.build();

      // Create a second account with the same batch number
      final otherUserId = '550e8400-e29b-41d4-a716-446655440002';
      final otherProfile = await ArtistProfile.db.insertRow(
        dbSession,
        ArtistProfile(
          authUserId: UuidValue.fromString(otherUserId),
          name: 'Other Artist',
          handle: 'other_artist',
        ),
      );
      final otherCustomer = await Customer.db.insertRow(
        dbSession,
        Customer(
          artistProfileId: otherProfile.id!,
          name: 'Charlie',
          email: 'charlie@example.com',
        ),
      );
      final otherMat = await Material.db.insertRow(
        dbSession,
        Material(
          artistProfileId: otherProfile.id!,
          type: MaterialType.ink,
          manufacturer: 'World Famous',
          supplier: 'Ink Co',
          productName: 'True Black',
          batchNumber: batch,
          status: MaterialStatus.inStock,
          expirationDate: DateTime(2028, 1, 1),
        ),
      );
      final otherAppt = await Appointment.db.insertRow(
        dbSession,
        Appointment(
          artistProfileId: otherProfile.id!,
          customerId: otherCustomer.id!,
          workplaceId: workplaceId,
          type: AppointmentType.tattoo,
          status: AppointmentStatus.finalized,
          scheduledAt: DateTime(2026, 6, 1, 10, 0),
          finalizedAt: DateTime(2026, 6, 1, 12, 0),
        ),
      );
      await AppointmentMaterial.db.insertRow(
        dbSession,
        AppointmentMaterial(
          appointmentId: otherAppt.id!,
          materialId: otherMat.id!,
          manufacturer: 'World Famous',
          productName: 'True Black',
          batchNumber: batch,
        ),
      );

      // Search as the OTHER account — should only see their own data
      final otherSession = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          otherUserId,
          {},
        ),
      );

      final results = await endpoints.recall.searchByBatch(otherSession, batch);

      expect(results, hasLength(1));
      expect(results.first.customerName, 'Charlie');
      expect(results.first.artistProfileName, 'Other Artist');
    });

    test('markContacted reflects in search results', () async {
      final batch = await setupCrossProfileScenario();

      // Initially not contacted
      var results = await endpoints.recall.searchByBatch(session, batch);
      expect(results.every((r) => r.contacted == false), isTrue);

      // Mark Alice as contacted
      final dbSession = session.build();
      final customer = await Customer.db.findFirstRow(
        dbSession,
        where: (t) => t.name.equals('Alice'),
      );
      await endpoints.recall.markContacted(session, customer!.id!, batch);

      // Search again — Alice should be contacted, Bob should not
      results = await endpoints.recall.searchByBatch(session, batch);
      final aliceResult = results.firstWhere((r) => r.customerName == 'Alice');
      final bobResult = results.firstWhere((r) => r.customerName == 'Bob');
      expect(aliceResult.contacted, isTrue);
      expect(bobResult.contacted, isFalse);
    });

    test('unmarkContacted removes contacted status', () async {
      final batch = await setupCrossProfileScenario();
      final dbSession = session.build();
      final customer = await Customer.db.findFirstRow(
        dbSession,
        where: (t) => t.name.equals('Alice'),
      );

      await endpoints.recall.markContacted(session, customer!.id!, batch);
      await endpoints.recall.unmarkContacted(session, customer.id!, batch);

      final results = await endpoints.recall.searchByBatch(session, batch);
      final aliceResult = results.firstWhere((r) => r.customerName == 'Alice');
      expect(aliceResult.contacted, isFalse);
    });

    test('returns empty list for unknown batch', () async {
      final dbSession = session.build();
      await ArtistProfile.db.insertRow(
        dbSession,
        ArtistProfile(
          authUserId: UuidValue.fromString(authUserId),
          name: 'Brand A',
          handle: 'brand_a_empty',
        ),
      );

      final results = await endpoints.recall.searchByBatch(
        session,
        'NONEXISTENT',
      );

      expect(results, isEmpty);
    });
  });
}
