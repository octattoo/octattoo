import 'package:test/test.dart';
import 'package:serverpod/serverpod.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('ArtistProfile', (sessionBuilder, endpoints) {
    test('authenticated endpoint returns artistProfileId', () async {
      final authUserId = UuidValue.fromString(
        '550e8400-e29b-41d4-a716-446655440000',
      );

      final authenticatedSession = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          authUserId.uuid,
          {},
        ),
      );

      final profileId = await endpoints.artistProfile.getMyProfileId(
        authenticatedSession,
      );
      expect(profileId, isA<UuidValue>());
    });

    test('returns same profileId on subsequent calls', () async {
      final authUserId = UuidValue.fromString(
        '550e8400-e29b-41d4-a716-446655440001',
      );

      final authenticatedSession = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          authUserId.uuid,
          {},
        ),
      );

      final first = await endpoints.artistProfile.getMyProfileId(
        authenticatedSession,
      );
      final second = await endpoints.artistProfile.getMyProfileId(
        authenticatedSession,
      );
      expect(first, equals(second));
    });

    test('rejects unauthenticated calls', () async {
      expect(
        () => endpoints.artistProfile.getMyProfileId(sessionBuilder),
        throwsA(isA<ServerpodUnauthenticatedException>()),
      );
    });
  });
}
