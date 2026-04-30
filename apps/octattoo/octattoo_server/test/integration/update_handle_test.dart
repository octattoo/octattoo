import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('updateHandle', (sessionBuilder, endpoints) {
    late TestSessionBuilder auth1;
    late TestSessionBuilder auth2;

    setUp(() {
      auth1 = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          '550e8400-e29b-41d4-a716-446655440040',
          {},
        ),
      );
      auth2 = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          '550e8400-e29b-41d4-a716-446655440041',
          {},
        ),
      );
    });

    test('changes handle successfully', () async {
      final profile = await endpoints.artistProfile.createProfile(
        auth1,
        'Artist',
        'old_handle',
      );

      final updated = await endpoints.artistProfile.updateHandle(
        auth1,
        profile.id!,
        'new_handle',
      );
      expect(updated.handle, equals('new_handle'));
    });

    test('old handle becomes available after change', () async {
      final profile = await endpoints.artistProfile.createProfile(
        auth1,
        'Artist',
        'released_one',
      );

      await endpoints.artistProfile.updateHandle(
        auth1,
        profile.id!,
        'kept_one',
      );

      final available = await endpoints.artistProfile.isHandleAvailable(
        auth1,
        'released_one',
      );
      expect(available, isTrue);
    });

    test('rejects handle taken by another profile', () async {
      await endpoints.artistProfile.createProfile(
        auth2,
        'Other',
        'taken_handle',
      );
      final mine = await endpoints.artistProfile.createProfile(
        auth1,
        'Mine',
        'my_handle',
      );

      expect(
        () => endpoints.artistProfile.updateHandle(
          auth1,
          mine.id!,
          'taken_handle',
        ),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('cannot update another accounts profile', () async {
      final theirs = await endpoints.artistProfile.createProfile(
        auth2,
        'Theirs',
        'their_handle',
      );

      expect(
        () => endpoints.artistProfile.updateHandle(
          auth1,
          theirs.id!,
          'stolen',
        ),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('rejects invalid new handle', () async {
      final profile = await endpoints.artistProfile.createProfile(
        auth1,
        'Artist',
        'valid_one',
      );

      expect(
        () => endpoints.artistProfile.updateHandle(auth1, profile.id!, 'X'),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
