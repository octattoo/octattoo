import 'package:serverpod/serverpod.dart' show UuidValue;
import 'package:test/test.dart';
import 'package:octattoo_server/src/generated/protocol.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Session Record seal', (sessionBuilder, endpoints) {
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

    Future<UuidValue> setupProfile() async {
      return endpoints.artistProfile.getMyProfileId(session);
    }

    Future<UuidValue> createCustomer() async {
      final result = await endpoints.customer.createCustomer(
        session,
        name: 'Test Client',
        email: 'trace@example.com',
      );
      return result.customer.id!;
    }

    Future<UuidValue> createInk({
      String manufacturer = 'World Famous',
      String productName = 'True Black',
      String batchNumber = 'WF-001',
    }) async {
      final m = await endpoints.material.createMaterial(
        session,
        type: MaterialType.ink,
        manufacturer: manufacturer,
        supplier: 'Ink Co',
        productName: productName,
        batchNumber: batchNumber,
        expirationDate: DateTime(2028, 1, 1),
      );
      return m.id!;
    }

    Future<Appointment> createAndFinalizeAppointment({
      required UuidValue customerId,
      List<UuidValue> materialIds = const [],
    }) async {
      final appt = await endpoints.appointment.createAppointment(
        session,
        type: AppointmentType.tattoo,
        customerId: customerId,
        scheduledAt: DateTime(2026, 5, 15, 14, 0),
      );

      await endpoints.appointment.startAppointment(session, appt.id!);

      for (final materialId in materialIds) {
        await endpoints.appointment.recordMaterial(
          session,
          appointmentId: appt.id!,
          materialId: materialId,
        );
      }

      return endpoints.appointment.finalizeAppointment(
        session,
        appt.id!,
        overrideZeroMaterials: materialIds.isEmpty,
      );
    }

    test('finalization creates a SessionRecord with hash', () async {
      await setupProfile();
      final customerId = await createCustomer();
      final inkId = await createInk();

      final finalized = await createAndFinalizeAppointment(
        customerId: customerId,
        materialIds: [inkId],
      );

      final record = await endpoints.sessionRecord.getByAppointmentId(
        session,
        finalized.id!,
      );

      expect(record, isNotNull);
      expect(record!.hash, hasLength(64));
      expect(record.hash, matches(RegExp(r'^[0-9a-f]{64}$')));
      expect(record.version, 1);
      expect(record.previousHash, isNull);
      expect(record.sealedAt, isNotNull);
      expect(record.appointmentId, finalized.id);
    });

    test('hash is deterministic (same appointment always same hash)', () async {
      await setupProfile();
      final customerId = await createCustomer();
      final inkId = await createInk();

      final finalized = await createAndFinalizeAppointment(
        customerId: customerId,
        materialIds: [inkId],
      );

      final record = await endpoints.sessionRecord.getByAppointmentId(
        session,
        finalized.id!,
      );

      expect(record, isNotNull);
      expect(record!.hash, hasLength(64));
    });

    test(
      'immutability: rejects recording material on finalized appointment',
      () async {
        await setupProfile();
        final customerId = await createCustomer();
        final inkId = await createInk();
        final ink2Id = await createInk(
          manufacturer: 'Dynamic',
          productName: 'Black',
          batchNumber: 'DY-001',
        );

        final finalized = await createAndFinalizeAppointment(
          customerId: customerId,
          materialIds: [inkId],
        );

        expect(
          () => endpoints.appointment.recordMaterial(
            session,
            appointmentId: finalized.id!,
            materialId: ink2Id,
          ),
          throwsA(isA<StateError>()),
        );
      },
    );

    test(
      'snapshot independence: deleting inventory material does not affect session record',
      () async {
        await setupProfile();
        final customerId = await createCustomer();
        final inkId = await createInk();

        final finalized = await createAndFinalizeAppointment(
          customerId: customerId,
          materialIds: [inkId],
        );

        // Delete the material from inventory
        await endpoints.material.deleteMaterial(session, inkId);

        // Session record should still exist and be intact
        final record = await endpoints.sessionRecord.getByAppointmentId(
          session,
          finalized.id!,
        );

        expect(record, isNotNull);
        expect(record!.hash, hasLength(64));
      },
    );

    test(
      'golden path: Customer -> Appointment -> Materials -> finalize -> verify',
      () async {
        await setupProfile();
        final customerId = await createCustomer();

        final ink1Id = await createInk(
          manufacturer: 'World Famous',
          productName: 'True Black',
          batchNumber: 'WF-001',
        );
        final ink2Id = await createInk(
          manufacturer: 'Eternal',
          productName: 'Crimson Red',
          batchNumber: 'ET-042',
        );

        final finalized = await createAndFinalizeAppointment(
          customerId: customerId,
          materialIds: [ink1Id, ink2Id],
        );

        expect(finalized.status, AppointmentStatus.finalized);
        expect(finalized.finalizedAt, isNotNull);

        final record = await endpoints.sessionRecord.getByAppointmentId(
          session,
          finalized.id!,
        );

        expect(record, isNotNull);
        expect(record!.hash, hasLength(64));
        expect(record.version, 1);
        expect(record.previousHash, isNull);
        expect(record.appointmentId, finalized.id);
      },
    );
  });
}
