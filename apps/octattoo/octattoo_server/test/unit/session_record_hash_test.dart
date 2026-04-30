import 'package:test/test.dart';
import 'package:serverpod/serverpod.dart' show UuidValue;
import 'package:octattoo_server/src/generated/protocol.dart';
import 'package:octattoo_server/src/traceability/session_record_hash.dart';

void main() {
  group('SessionRecord hash computation', () {
    final appointmentId = UuidValue.fromString(
      '550e8400-e29b-41d4-a716-446655440099',
    );
    final artistProfileId = UuidValue.fromString(
      '550e8400-e29b-41d4-a716-446655440001',
    );
    final customerId = UuidValue.fromString(
      '550e8400-e29b-41d4-a716-446655440002',
    );
    final finalizedAt = DateTime.utc(2026, 5, 15, 14, 0, 0);

    final materials = [
      AppointmentMaterial(
        appointmentId: appointmentId,
        materialId: UuidValue.fromString(
          '550e8400-e29b-41d4-a716-446655440010',
        ),
        manufacturer: 'World Famous',
        productName: 'True Black',
        batchNumber: 'WF-001',
      ),
      AppointmentMaterial(
        appointmentId: appointmentId,
        materialId: UuidValue.fromString(
          '550e8400-e29b-41d4-a716-446655440011',
        ),
        manufacturer: 'Cheyenne',
        productName: 'Hawk Pen',
        batchNumber: 'CH-001',
      ),
    ];

    test('produces a 64-char hex string (SHA-256)', () {
      final hash = computeSessionRecordHash(
        appointmentId: appointmentId,
        artistProfileId: artistProfileId,
        customerId: customerId,
        finalizedAt: finalizedAt,
        type: AppointmentType.tattoo,
        materials: materials,
      );

      expect(hash, hasLength(64));
      expect(hash, matches(RegExp(r'^[0-9a-f]{64}$')));
    });

    test('is deterministic (same inputs produces same hash)', () {
      final hash1 = computeSessionRecordHash(
        appointmentId: appointmentId,
        artistProfileId: artistProfileId,
        customerId: customerId,
        finalizedAt: finalizedAt,
        type: AppointmentType.tattoo,
        materials: materials,
      );

      final hash2 = computeSessionRecordHash(
        appointmentId: appointmentId,
        artistProfileId: artistProfileId,
        customerId: customerId,
        finalizedAt: finalizedAt,
        type: AppointmentType.tattoo,
        materials: materials,
      );

      expect(hash1, equals(hash2));
    });

    test('material order does not affect hash (sorted internally)', () {
      final reversed = materials.reversed.toList();

      final hash1 = computeSessionRecordHash(
        appointmentId: appointmentId,
        artistProfileId: artistProfileId,
        customerId: customerId,
        finalizedAt: finalizedAt,
        type: AppointmentType.tattoo,
        materials: materials,
      );

      final hash2 = computeSessionRecordHash(
        appointmentId: appointmentId,
        artistProfileId: artistProfileId,
        customerId: customerId,
        finalizedAt: finalizedAt,
        type: AppointmentType.tattoo,
        materials: reversed,
      );

      expect(hash1, equals(hash2));
    });

    test('different inputs produce different hashes', () {
      final hash1 = computeSessionRecordHash(
        appointmentId: appointmentId,
        artistProfileId: artistProfileId,
        customerId: customerId,
        finalizedAt: finalizedAt,
        type: AppointmentType.tattoo,
        materials: materials,
      );

      final hash2 = computeSessionRecordHash(
        appointmentId: appointmentId,
        artistProfileId: artistProfileId,
        customerId: customerId,
        finalizedAt: finalizedAt,
        type: AppointmentType.consultation,
        materials: materials,
      );

      expect(hash1, isNot(equals(hash2)));
    });

    test('works with empty materials list', () {
      final hash = computeSessionRecordHash(
        appointmentId: appointmentId,
        artistProfileId: artistProfileId,
        customerId: customerId,
        finalizedAt: finalizedAt,
        type: AppointmentType.consultation,
        materials: [],
      );

      expect(hash, hasLength(64));
      expect(hash, matches(RegExp(r'^[0-9a-f]{64}$')));
    });
  });
}
