import 'package:test/test.dart';
import 'package:serverpod/serverpod.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('ArtistProfile', (sessionBuilder, endpoints) {
    test('createProfile returns profile with id', () async {
      final auth = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          '550e8400-e29b-41d4-a716-446655440000',
          {},
        ),
      );

      final profile = await endpoints.artistProfile.createProfile(
        auth,
        'Artist',
        'artist_test',
      );
      expect(profile.id, isA<UuidValue>());
    });

    test('listMyProfiles returns created profiles', () async {
      final auth = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          '550e8400-e29b-41d4-a716-446655440001',
          {},
        ),
      );

      await endpoints.artistProfile.createProfile(auth, 'First', 'first_p');
      await endpoints.artistProfile.createProfile(auth, 'Second', 'second_p');

      final profiles = await endpoints.artistProfile.listMyProfiles(auth);
      expect(profiles, hasLength(2));
    });

    test('rejects unauthenticated calls', () async {
      expect(
        () => endpoints.artistProfile.listMyProfiles(sessionBuilder),
        throwsA(isA<ServerpodUnauthenticatedException>()),
      );
    });
  });
}
