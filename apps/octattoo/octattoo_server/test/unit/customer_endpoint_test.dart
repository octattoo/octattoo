import 'package:test/test.dart';
import 'package:serverpod/serverpod.dart';

import 'package:octattoo_server/src/customer/customer_endpoint.dart';
import 'package:octattoo_server/src/generated/protocol.dart';

void main() {
  group('CustomerEndpoint validation', () {
    test('createCustomer throws when neither email nor phone provided', () {
      final endpoint = CustomerEndpoint();
      expect(
        () => endpoint.validateContact(email: null, phone: null),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('validateContact passes with email only', () {
      final endpoint = CustomerEndpoint();
      expect(
        () => endpoint.validateContact(email: 'a@b.com', phone: null),
        returnsNormally,
      );
    });

    test('validateContact passes with phone only', () {
      final endpoint = CustomerEndpoint();
      expect(
        () => endpoint.validateContact(email: null, phone: '+33612345678'),
        returnsNormally,
      );
    });
  });

  group('CustomerEndpoint duplicate detection', () {
    test('findDuplicatesIn returns empty when no matches', () {
      final endpoint = CustomerEndpoint();
      final result = endpoint.findDuplicatesIn(
        email: 'new@example.com',
        phone: null,
        existing: [],
      );
      expect(result, isEmpty);
    });

    test('findDuplicatesIn matches by email', () {
      final endpoint = CustomerEndpoint();
      final existing = [
        _fakeCustomer(email: 'dup@example.com', phone: null),
      ];
      final result = endpoint.findDuplicatesIn(
        email: 'dup@example.com',
        phone: null,
        existing: existing,
      );
      expect(result, hasLength(1));
    });

    test('findDuplicatesIn matches by phone', () {
      final endpoint = CustomerEndpoint();
      final existing = [
        _fakeCustomer(email: null, phone: '+33612345678'),
      ];
      final result = endpoint.findDuplicatesIn(
        email: null,
        phone: '+33612345678',
        existing: existing,
      );
      expect(result, hasLength(1));
    });

    test('findDuplicatesIn does not match different contact', () {
      final endpoint = CustomerEndpoint();
      final existing = [
        _fakeCustomer(email: 'other@example.com', phone: '+33600000000'),
      ];
      final result = endpoint.findDuplicatesIn(
        email: 'new@example.com',
        phone: '+33611111111',
        existing: existing,
      );
      expect(result, isEmpty);
    });
  });
}

Customer _fakeCustomer({String? email, String? phone}) {
  return Customer(
    artistProfileId: UuidValue.fromString(
      '550e8400-e29b-41d4-a716-446655440000',
    ),
    name: 'Test',
    email: email,
    phone: phone,
  );
}
