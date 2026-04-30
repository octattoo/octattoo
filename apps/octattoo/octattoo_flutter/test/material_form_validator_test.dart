import 'package:flutter_test/flutter_test.dart';

import 'package:octattoo_flutter/src/inventory/material_form_validator.dart';

void main() {
  group('MaterialFormValidator', () {
    test('validateRequired rejects empty values', () {
      expect(MaterialFormValidator.validateRequired(null, 'Name'), isNotNull);
      expect(MaterialFormValidator.validateRequired('', 'Name'), isNotNull);
      expect(MaterialFormValidator.validateRequired('Value', 'Name'), isNull);
    });

    test('validateQuantity required for needles', () {
      expect(
        MaterialFormValidator.validateQuantity(null, isNeedle: true),
        isNotNull,
      );
      expect(
        MaterialFormValidator.validateQuantity('', isNeedle: true),
        isNotNull,
      );
      expect(
        MaterialFormValidator.validateQuantity('0', isNeedle: true),
        isNotNull,
      );
      expect(
        MaterialFormValidator.validateQuantity('-1', isNeedle: true),
        isNotNull,
      );
      expect(
        MaterialFormValidator.validateQuantity('abc', isNeedle: true),
        isNotNull,
      );
      expect(
        MaterialFormValidator.validateQuantity('10', isNeedle: true),
        isNull,
      );
    });

    test('validateQuantity ignored for ink', () {
      expect(
        MaterialFormValidator.validateQuantity(null, isNeedle: false),
        isNull,
      );
      expect(
        MaterialFormValidator.validateQuantity('', isNeedle: false),
        isNull,
      );
    });

    test('validateExpirationDate rejects null', () {
      expect(MaterialFormValidator.validateExpirationDate(null), isNotNull);
      expect(
        MaterialFormValidator.validateExpirationDate(DateTime(2027, 1, 1)),
        isNull,
      );
    });
  });
}
