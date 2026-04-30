import 'package:test/test.dart';

import 'package:octattoo_server/src/inventory/material_endpoint.dart';
import 'package:octattoo_server/src/generated/protocol.dart';

void main() {
  group('MaterialEndpoint validation', () {
    final endpoint = MaterialEndpoint();

    test('needle requires quantity > 0', () {
      expect(
        () => endpoint.validateMaterial(type: MaterialType.needle, quantity: null),
        throwsA(isA<ArgumentError>()),
      );
      expect(
        () => endpoint.validateMaterial(type: MaterialType.needle, quantity: 0),
        throwsA(isA<ArgumentError>()),
      );
      expect(
        () => endpoint.validateMaterial(type: MaterialType.needle, quantity: -1),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('needle passes with quantity > 0', () {
      expect(
        () => endpoint.validateMaterial(type: MaterialType.needle, quantity: 10),
        returnsNormally,
      );
    });

    test('ink must not have a quantity', () {
      expect(
        () => endpoint.validateMaterial(type: MaterialType.ink, quantity: 5),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('ink passes with null quantity', () {
      expect(
        () => endpoint.validateMaterial(type: MaterialType.ink, quantity: null),
        returnsNormally,
      );
    });
  });
}
