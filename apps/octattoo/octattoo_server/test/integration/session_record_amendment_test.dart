import 'package:serverpod/serverpod.dart' show UuidValue;
import 'package:test/test.dart';
import 'package:octattoo_server/src/generated/protocol.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Session Record amendments', (sessionBuilder, endpoints) {
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
      final p = await endpoints.artistProfile.createProfile(
        session,
        'Artist',
        'artist_amend',
      );
      return p.id!;
    }

    Future<UuidValue> createCustomer() async {
      final result = await endpoints.customer.createCustomer(
        session,
        name: 'Amend Client',
        email: 'amend@example.com',
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

    test('amendment creates a new version with hash chain', () async {
      await setupProfile();
      final customerId = await createCustomer();
      final inkId = await createInk();
      final ink2Id = await createInk(
        manufacturer: 'Eternal',
        productName: 'Crimson Red',
        batchNumber: 'ET-042',
      );

      final finalized = await createAndFinalizeAppointment(
        customerId: customerId,
        materialIds: [inkId],
      );

      final v1 = await endpoints.sessionRecord.getByAppointmentId(
        session,
        finalized.id!,
      );

      final v2 = await endpoints.sessionRecord.amendSessionRecord(
        session,
        finalized.id!,
        [ink2Id],
        'Corrected ink batch used',
      );

      expect(v2.version, 2);
      expect(v2.previousHash, v1!.hash);
      expect(v2.reason, 'Corrected ink batch used');
      expect(v2.hash, isNot(equals(v1.hash)));
      expect(v2.appointmentId, finalized.id);
    });

    test('original version preserved in version history', () async {
      await setupProfile();
      final customerId = await createCustomer();
      final inkId = await createInk();
      final ink2Id = await createInk(
        manufacturer: 'Eternal',
        productName: 'Crimson Red',
        batchNumber: 'ET-042',
      );

      final finalized = await createAndFinalizeAppointment(
        customerId: customerId,
        materialIds: [inkId],
      );

      final v1 = await endpoints.sessionRecord.getByAppointmentId(
        session,
        finalized.id!,
      );

      await endpoints.sessionRecord.amendSessionRecord(
        session,
        finalized.id!,
        [ink2Id],
        'Corrected ink batch',
      );

      final history = await endpoints.sessionRecord.getVersionHistory(
        session,
        finalized.id!,
      );

      expect(history, hasLength(2));
      expect(history[0].version, 1);
      expect(history[0].hash, v1!.hash);
      expect(history[0].reason, isNull);
      expect(history[1].version, 2);
      expect(history[1].reason, 'Corrected ink batch');
    });

    test('reason required for amendments', () async {
      await setupProfile();
      final customerId = await createCustomer();
      final inkId = await createInk();

      final finalized = await createAndFinalizeAppointment(
        customerId: customerId,
        materialIds: [inkId],
      );

      expect(
        () => endpoints.sessionRecord.amendSessionRecord(
          session,
          finalized.id!,
          [inkId],
          '',
        ),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('sequential versioning with chained hashes', () async {
      await setupProfile();
      final customerId = await createCustomer();
      final inkId = await createInk();
      final ink2Id = await createInk(
        manufacturer: 'Eternal',
        productName: 'Crimson Red',
        batchNumber: 'ET-042',
      );

      final finalized = await createAndFinalizeAppointment(
        customerId: customerId,
        materialIds: [inkId],
      );

      final v2 = await endpoints.sessionRecord.amendSessionRecord(
        session,
        finalized.id!,
        [ink2Id],
        'First correction',
      );

      final v3 = await endpoints.sessionRecord.amendSessionRecord(
        session,
        finalized.id!,
        [inkId, ink2Id],
        'Second correction',
      );

      expect(v2.version, 2);
      expect(v3.version, 3);
      expect(v3.previousHash, v2.hash);

      final history = await endpoints.sessionRecord.getVersionHistory(
        session,
        finalized.id!,
      );
      expect(history, hasLength(3));
    });

    test('getByAppointmentId returns latest version', () async {
      await setupProfile();
      final customerId = await createCustomer();
      final inkId = await createInk();
      final ink2Id = await createInk(
        manufacturer: 'Eternal',
        productName: 'Crimson Red',
        batchNumber: 'ET-042',
      );

      final finalized = await createAndFinalizeAppointment(
        customerId: customerId,
        materialIds: [inkId],
      );

      await endpoints.sessionRecord.amendSessionRecord(
        session,
        finalized.id!,
        [ink2Id],
        'Updated materials',
      );

      final latest = await endpoints.sessionRecord.getByAppointmentId(
        session,
        finalized.id!,
      );

      expect(latest!.version, 2);
      expect(latest.reason, 'Updated materials');
    });

    test('cannot amend non-finalized appointment', () async {
      await setupProfile();
      final customerId = await createCustomer();
      final inkId = await createInk();

      final appt = await endpoints.appointment.createAppointment(
        session,
        type: AppointmentType.tattoo,
        customerId: customerId,
        scheduledAt: DateTime(2026, 5, 15, 14, 0),
      );

      expect(
        () => endpoints.sessionRecord.amendSessionRecord(
          session,
          appt.id!,
          [inkId],
          'Should fail',
        ),
        throwsA(isA<StateError>()),
      );
    });
  });
}
