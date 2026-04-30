import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('createProfile', (sessionBuilder, endpoints) {
    late TestSessionBuilder auth1;
    late TestSessionBuilder auth2;

    setUp(() {
      auth1 = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          '550e8400-e29b-41d4-a716-446655440020',
          {},
        ),
      );
      auth2 = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          '550e8400-e29b-41d4-a716-446655440021',
          {},
        ),
      );
    });

    test('creates profile with name and handle', () async {
      final profile = await endpoints.artistProfile.createProfile(
        auth1,
        'Alice Ink',
        'alice_ink',
      );
      expect(profile.name, equals('Alice Ink'));
      expect(profile.handle, equals('alice_ink'));
      expect(profile.id, isNotNull);
    });

    test('same account can create multiple profiles', () async {
      final p1 = await endpoints.artistProfile.createProfile(
        auth1,
        'Brand One',
        'brand_one',
      );
      final p2 = await endpoints.artistProfile.createProfile(
        auth1,
        'Brand Two',
        'brand_two',
      );
      expect(p1.id, isNot(equals(p2.id)));
      expect(p1.handle, isNot(equals(p2.handle)));
    });

    test('rejects duplicate handle across accounts', () async {
      await endpoints.artistProfile.createProfile(
        auth1,
        'First',
        'unique_handle',
      );
      expect(
        () => endpoints.artistProfile.createProfile(
          auth2,
          'Second',
          'unique_handle',
        ),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('rejects invalid handle', () async {
      expect(
        () => endpoints.artistProfile.createProfile(auth1, 'Name', 'BAD'),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
