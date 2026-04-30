import 'package:test/test.dart';

import 'package:octattoo_server/src/artist_profile/handle_validator.dart';

void main() {
  group('Handle validation', () {
    test('accepts valid handle', () {
      expect(HandleValidator.isValid('alice_ink'), isTrue);
    });

    test('accepts minimum length (3 chars)', () {
      expect(HandleValidator.isValid('abc'), isTrue);
    });

    test('accepts maximum length (30 chars)', () {
      expect(HandleValidator.isValid('a' * 30), isTrue);
    });

    test('rejects empty string', () {
      expect(HandleValidator.isValid(''), isFalse);
    });

    test('rejects too short (2 chars)', () {
      expect(HandleValidator.isValid('ab'), isFalse);
    });

    test('rejects too long (31 chars)', () {
      expect(HandleValidator.isValid('a' * 31), isFalse);
    });

    test('rejects uppercase letters', () {
      expect(HandleValidator.isValid('Alice'), isFalse);
    });

    test('rejects starting with number', () {
      expect(HandleValidator.isValid('1alice'), isFalse);
    });

    test('rejects starting with underscore', () {
      expect(HandleValidator.isValid('_alice'), isFalse);
    });

    test('rejects special characters', () {
      expect(HandleValidator.isValid('alice-ink'), isFalse);
      expect(HandleValidator.isValid('alice.ink'), isFalse);
      expect(HandleValidator.isValid('alice ink'), isFalse);
    });

    test('allows underscores after first char', () {
      expect(HandleValidator.isValid('a_b_c'), isTrue);
    });

    test('allows digits after first char', () {
      expect(HandleValidator.isValid('alice99'), isTrue);
    });
  });
}
