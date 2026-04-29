import 'package:flutter_test/flutter_test.dart';

import 'package:octattoo_flutter/src/customer/customer_form_validator.dart';

void main() {
  group('CustomerFormValidator', () {
    test('name is required', () {
      expect(CustomerFormValidator.validateName(null), isNotNull);
      expect(CustomerFormValidator.validateName(''), isNotNull);
      expect(CustomerFormValidator.validateName('Alice'), isNull);
    });

    test('at least one of email or phone required', () {
      expect(
        CustomerFormValidator.validateContact(email: null, phone: null),
        isNotNull,
      );
      expect(
        CustomerFormValidator.validateContact(email: '', phone: ''),
        isNotNull,
      );
      expect(
        CustomerFormValidator.validateContact(
          email: 'a@b.com',
          phone: null,
        ),
        isNull,
      );
      expect(
        CustomerFormValidator.validateContact(
          email: null,
          phone: '+33612345678',
        ),
        isNull,
      );
    });

    test('email format validation', () {
      expect(CustomerFormValidator.validateEmail('not-an-email'), isNotNull);
      expect(CustomerFormValidator.validateEmail('valid@example.com'), isNull);
      expect(CustomerFormValidator.validateEmail(null), isNull);
      expect(CustomerFormValidator.validateEmail(''), isNull);
    });
  });
}
