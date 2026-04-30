import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('suggestHandle', (sessionBuilder, endpoints) {
    late TestSessionBuilder auth1;

    setUp(() {
      auth1 = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          '550e8400-e29b-41d4-a716-446655440050',
          {},
        ),
      );
    });

    test('slugifies display name', () async {
      final suggestion = await endpoints.artistProfile.suggestHandle(
        auth1,
        'Alice Ink',
      );
      expect(suggestion, equals('alice_ink'));
    });

    test('strips special characters', () async {
      final suggestion = await endpoints.artistProfile.suggestHandle(
        auth1,
        'José María!',
      );
      // Only keeps ascii letters/digits/underscores, starts with letter
      expect(
        RegExp(r'^[a-z][a-z0-9_]{2,29}$').hasMatch(suggestion),
        isTrue,
      );
    });

    test('appends suffix when base is taken', () async {
      await endpoints.artistProfile.createProfile(
        auth1,
        'Alice',
        'alice_ink',
      );

      final suggestion = await endpoints.artistProfile.suggestHandle(
        auth1,
        'Alice Ink',
      );
      expect(suggestion, isNot(equals('alice_ink')));
      expect(
        RegExp(r'^[a-z][a-z0-9_]{2,29}$').hasMatch(suggestion),
        isTrue,
      );
    });

    test('pads short names to minimum length', () async {
      final suggestion = await endpoints.artistProfile.suggestHandle(
        auth1,
        'Al',
      );
      expect(suggestion.length, greaterThanOrEqualTo(3));
      expect(
        RegExp(r'^[a-z][a-z0-9_]{2,29}$').hasMatch(suggestion),
        isTrue,
      );
    });
  });
}
