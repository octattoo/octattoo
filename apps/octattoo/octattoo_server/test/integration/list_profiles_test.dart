import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('listMyProfiles', (sessionBuilder, endpoints) {
    late TestSessionBuilder auth1;
    late TestSessionBuilder auth2;

    setUp(() {
      auth1 = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          '550e8400-e29b-41d4-a716-446655440030',
          {},
        ),
      );
      auth2 = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          '550e8400-e29b-41d4-a716-446655440031',
          {},
        ),
      );
    });

    test('returns empty list for new account', () async {
      final profiles = await endpoints.artistProfile.listMyProfiles(auth1);
      expect(profiles, isEmpty);
    });

    test('returns all profiles for the account', () async {
      await endpoints.artistProfile.createProfile(auth1, 'One', 'prof_one');
      await endpoints.artistProfile.createProfile(auth1, 'Two', 'prof_two');

      final profiles = await endpoints.artistProfile.listMyProfiles(auth1);
      expect(profiles, hasLength(2));
      expect(profiles.map((p) => p.handle), containsAll(['prof_one', 'prof_two']));
    });

    test('does not return other accounts profiles', () async {
      await endpoints.artistProfile.createProfile(auth1, 'Mine', 'mine_only');
      await endpoints.artistProfile.createProfile(auth2, 'Theirs', 'theirs_only');

      final myProfiles = await endpoints.artistProfile.listMyProfiles(auth1);
      expect(myProfiles, hasLength(1));
      expect(myProfiles.first.handle, equals('mine_only'));
    });
  });
}
