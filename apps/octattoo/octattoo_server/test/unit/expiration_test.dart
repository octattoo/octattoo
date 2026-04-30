import 'package:test/test.dart';

import 'package:octattoo_server/src/inventory/expiration_filter.dart';
import 'package:octattoo_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

Material _material({
  required DateTime expirationDate,
  MaterialStatus status = MaterialStatus.inStock,
}) {
  return Material(
    artistProfileId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    type: MaterialType.ink,
    manufacturer: 'Test',
    supplier: 'Test',
    productName: 'Test Ink',
    batchNumber: 'B001',
    expirationDate: expirationDate,
    status: status,
  );
}

void main() {
  final now = DateTime(2026, 4, 30);

  group('ExpirationFilter.filterExpiring', () {
    test('returns materials expiring within threshold', () {
      final materials = [
        _material(expirationDate: DateTime(2026, 5, 15)), // 15 days out
        _material(expirationDate: DateTime(2026, 6, 15)), // 46 days out
      ];

      final result = ExpirationFilter.filterExpiring(
        materials,
        thresholdDays: 30,
        now: now,
      );

      expect(result, hasLength(1));
      expect(result.first.expirationDate, DateTime(2026, 5, 15));
    });

    test('includes material expiring exactly at threshold boundary', () {
      final materials = [
        _material(expirationDate: DateTime(2026, 5, 30)), // exactly 30 days
      ];

      final result = ExpirationFilter.filterExpiring(
        materials,
        thresholdDays: 30,
        now: now,
      );

      expect(result, hasLength(1));
    });

    test('includes material expiring today', () {
      final materials = [
        _material(expirationDate: now),
      ];

      final result = ExpirationFilter.filterExpiring(
        materials,
        thresholdDays: 30,
        now: now,
      );

      expect(result, hasLength(1));
    });

    test('includes already-expired materials', () {
      final materials = [
        _material(expirationDate: DateTime(2026, 4, 20)), // 10 days ago
      ];

      final result = ExpirationFilter.filterExpiring(
        materials,
        thresholdDays: 30,
        now: now,
      );

      expect(result, hasLength(1));
    });

    test('excludes materials with status empty', () {
      final materials = [
        _material(
          expirationDate: DateTime(2026, 5, 15),
          status: MaterialStatus.empty,
        ),
      ];

      final result = ExpirationFilter.filterExpiring(
        materials,
        thresholdDays: 30,
        now: now,
      );

      expect(result, isEmpty);
    });

    test('excludes material expiring one day past threshold', () {
      final materials = [
        _material(expirationDate: DateTime(2026, 5, 31)), // 31 days out
      ];

      final result = ExpirationFilter.filterExpiring(
        materials,
        thresholdDays: 30,
        now: now,
      );

      expect(result, isEmpty);
    });
  });
}
