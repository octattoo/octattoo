import 'package:serverpod/serverpod.dart' show UuidValue;
import 'package:test/test.dart';
import 'package:octattoo_server/src/generated/protocol.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Appointment lifecycle', (sessionBuilder, endpoints) {
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

    Future<UuidValue> setupProfile(TestSessionBuilder s) async {
      final p = await endpoints.artistProfile.createProfile(s, 'Artist', 'artist_${s.hashCode}');
      return p.id!;
    }

    Future<UuidValue> createCustomer(TestSessionBuilder s) async {
      final result = await endpoints.customer.createCustomer(
        s,
        name: 'Test Client',
        email: 'test@example.com',
      );
      return result.customer.id!;
    }

    Future<UuidValue> createNeedle(TestSessionBuilder s) async {
      final m = await endpoints.material.createMaterial(
        s,
        type: MaterialType.needle,
        manufacturer: 'Cheyenne',
        supplier: 'Depot',
        productName: 'Hawk Pen',
        batchNumber: 'CH-001',
        expirationDate: DateTime(2028, 1, 1),
        quantity: 5,
      );
      return m.id!;
    }

    Future<UuidValue> createInk(TestSessionBuilder s) async {
      final m = await endpoints.material.createMaterial(
        s,
        type: MaterialType.ink,
        manufacturer: 'World Famous',
        supplier: 'Ink Co',
        productName: 'True Black',
        batchNumber: 'WF-001',
        expirationDate: DateTime(2028, 1, 1),
      );
      return m.id!;
    }

    test('creates an appointment in scheduled status', () async {
      await setupProfile(session1);
      final customerId = await createCustomer(session1);

      final appt = await endpoints.appointment.createAppointment(
        session1,
        type: AppointmentType.tattoo,
        customerId: customerId,
        scheduledAt: DateTime(2026, 5, 15, 14, 0),
        notes: 'Full sleeve session 1',
      );

      expect(appt.id, isNotNull);
      expect(appt.status, AppointmentStatus.scheduled);
      expect(appt.type, AppointmentType.tattoo);
      expect(appt.notes, 'Full sleeve session 1');
    });

    test('starts an appointment (scheduled → inProgress)', () async {
      await setupProfile(session1);
      final customerId = await createCustomer(session1);

      final appt = await endpoints.appointment.createAppointment(
        session1,
        type: AppointmentType.tattoo,
        customerId: customerId,
        scheduledAt: DateTime(2026, 5, 15, 14, 0),
      );

      final started = await endpoints.appointment.startAppointment(
        session1,
        appt.id!,
      );

      expect(started.status, AppointmentStatus.inProgress);
      expect(started.startedAt, isNotNull);
    });

    test('rejects starting an already in-progress appointment', () async {
      await setupProfile(session1);
      final customerId = await createCustomer(session1);

      final appt = await endpoints.appointment.createAppointment(
        session1,
        type: AppointmentType.tattoo,
        customerId: customerId,
        scheduledAt: DateTime(2026, 5, 15, 14, 0),
      );

      await endpoints.appointment.startAppointment(session1, appt.id!);

      expect(
        () => endpoints.appointment.startAppointment(session1, appt.id!),
        throwsA(isA<StateError>()),
      );
    });

    test('rejects starting a finalized appointment', () async {
      await setupProfile(session1);
      final customerId = await createCustomer(session1);
      final inkId = await createInk(session1);

      final appt = await endpoints.appointment.createAppointment(
        session1,
        type: AppointmentType.tattoo,
        customerId: customerId,
        scheduledAt: DateTime(2026, 5, 15, 14, 0),
      );

      await endpoints.appointment.startAppointment(session1, appt.id!);
      await endpoints.appointment.recordMaterial(
        session1,
        appointmentId: appt.id!,
        materialId: inkId,
      );
      await endpoints.appointment.finalizeAppointment(
        session1,
        appt.id!,
        overrideZeroMaterials: false,
      );

      expect(
        () => endpoints.appointment.startAppointment(session1, appt.id!),
        throwsA(isA<StateError>()),
      );
    });

    test('finalizes an in-progress appointment', () async {
      await setupProfile(session1);
      final customerId = await createCustomer(session1);
      final inkId = await createInk(session1);

      final appt = await endpoints.appointment.createAppointment(
        session1,
        type: AppointmentType.tattoo,
        customerId: customerId,
        scheduledAt: DateTime(2026, 5, 15, 14, 0),
      );

      await endpoints.appointment.startAppointment(session1, appt.id!);
      await endpoints.appointment.recordMaterial(
        session1,
        appointmentId: appt.id!,
        materialId: inkId,
      );

      final finalized = await endpoints.appointment.finalizeAppointment(
        session1,
        appt.id!,
        overrideZeroMaterials: false,
      );

      expect(finalized.status, AppointmentStatus.finalized);
      expect(finalized.finalizedAt, isNotNull);
    });

    test('rejects finalizing a scheduled appointment', () async {
      await setupProfile(session1);
      final customerId = await createCustomer(session1);

      final appt = await endpoints.appointment.createAppointment(
        session1,
        type: AppointmentType.tattoo,
        customerId: customerId,
        scheduledAt: DateTime(2026, 5, 15, 14, 0),
      );

      expect(
        () => endpoints.appointment.finalizeAppointment(
          session1,
          appt.id!,
          overrideZeroMaterials: false,
        ),
        throwsA(isA<StateError>()),
      );
    });

    test('tattoo finalization warns on zero materials', () async {
      await setupProfile(session1);
      final customerId = await createCustomer(session1);

      final appt = await endpoints.appointment.createAppointment(
        session1,
        type: AppointmentType.tattoo,
        customerId: customerId,
        scheduledAt: DateTime(2026, 5, 15, 14, 0),
      );

      await endpoints.appointment.startAppointment(session1, appt.id!);

      expect(
        () => endpoints.appointment.finalizeAppointment(
          session1,
          appt.id!,
          overrideZeroMaterials: false,
        ),
        throwsA(
          isA<StateError>().having(
            (e) => e.message,
            'message',
            'zero_materials_warning',
          ),
        ),
      );
    });

    test('tattoo finalization succeeds with override', () async {
      await setupProfile(session1);
      final customerId = await createCustomer(session1);

      final appt = await endpoints.appointment.createAppointment(
        session1,
        type: AppointmentType.tattoo,
        customerId: customerId,
        scheduledAt: DateTime(2026, 5, 15, 14, 0),
      );

      await endpoints.appointment.startAppointment(session1, appt.id!);

      final finalized = await endpoints.appointment.finalizeAppointment(
        session1,
        appt.id!,
        overrideZeroMaterials: true,
      );

      expect(finalized.status, AppointmentStatus.finalized);
    });

    test('consultation finalization does not warn on zero materials', () async {
      await setupProfile(session1);
      final customerId = await createCustomer(session1);

      final appt = await endpoints.appointment.createAppointment(
        session1,
        type: AppointmentType.consultation,
        customerId: customerId,
        scheduledAt: DateTime(2026, 5, 15, 14, 0),
      );

      await endpoints.appointment.startAppointment(session1, appt.id!);

      final finalized = await endpoints.appointment.finalizeAppointment(
        session1,
        appt.id!,
        overrideZeroMaterials: false,
      );

      expect(finalized.status, AppointmentStatus.finalized);
    });

    test('records material with snapshot data', () async {
      await setupProfile(session1);
      final customerId = await createCustomer(session1);
      final inkId = await createInk(session1);

      final appt = await endpoints.appointment.createAppointment(
        session1,
        type: AppointmentType.tattoo,
        customerId: customerId,
        scheduledAt: DateTime(2026, 5, 15, 14, 0),
      );

      await endpoints.appointment.startAppointment(session1, appt.id!);

      final linked = await endpoints.appointment.recordMaterial(
        session1,
        appointmentId: appt.id!,
        materialId: inkId,
      );

      expect(linked.id, isNotNull);
      expect(linked.manufacturer, 'World Famous');
      expect(linked.productName, 'True Black');
      expect(linked.batchNumber, 'WF-001');
      expect(linked.linkedAt, isNotNull);
    });

    test('rejects recording material when not in progress', () async {
      await setupProfile(session1);
      final customerId = await createCustomer(session1);
      final inkId = await createInk(session1);

      final appt = await endpoints.appointment.createAppointment(
        session1,
        type: AppointmentType.tattoo,
        customerId: customerId,
        scheduledAt: DateTime(2026, 5, 15, 14, 0),
      );

      expect(
        () => endpoints.appointment.recordMaterial(
          session1,
          appointmentId: appt.id!,
          materialId: inkId,
        ),
        throwsA(isA<StateError>()),
      );
    });

    test('needle quantity decrements when linked', () async {
      await setupProfile(session1);
      final customerId = await createCustomer(session1);
      final needleId = await createNeedle(session1);

      final appt = await endpoints.appointment.createAppointment(
        session1,
        type: AppointmentType.tattoo,
        customerId: customerId,
        scheduledAt: DateTime(2026, 5, 15, 14, 0),
      );

      await endpoints.appointment.startAppointment(session1, appt.id!);
      await endpoints.appointment.recordMaterial(
        session1,
        appointmentId: appt.id!,
        materialId: needleId,
      );

      final updated = await endpoints.material.getMaterial(session1, needleId);
      expect(updated!.quantity, 4);
    });

    test('cross-profile isolation: cannot start other profile appointment',
        () async {
      await setupProfile(session1);
      await setupProfile(session2);
      final customerId = await createCustomer(session1);

      final appt = await endpoints.appointment.createAppointment(
        session1,
        type: AppointmentType.tattoo,
        customerId: customerId,
        scheduledAt: DateTime(2026, 5, 15, 14, 0),
      );

      expect(
        () => endpoints.appointment.startAppointment(session2, appt.id!),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('lists appointments for current profile only', () async {
      await setupProfile(session1);
      await setupProfile(session2);
      final customerId = await createCustomer(session1);

      await endpoints.appointment.createAppointment(
        session1,
        type: AppointmentType.tattoo,
        customerId: customerId,
        scheduledAt: DateTime(2026, 5, 15, 14, 0),
      );

      final list1 = await endpoints.appointment.listAppointments(session1);
      final list2 = await endpoints.appointment.listAppointments(session2);

      expect(list1, hasLength(1));
      expect(list2, isEmpty);
    });
  });
}
