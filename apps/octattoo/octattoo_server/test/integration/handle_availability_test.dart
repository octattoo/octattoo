import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Handle availability', (sessionBuilder, endpoints) {
    late TestSessionBuilder auth1;

    setUp(() {
      auth1 = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          '550e8400-e29b-41d4-a716-446655440010',
          {},
        ),
      );
    });

    test('returns true for untaken handle', () async {
      final available = await endpoints.artistProfile.isHandleAvailable(
        auth1,
        'fresh_handle',
      );
      expect(available, isTrue);
    });

    test('returns false for taken handle', () async {
      await endpoints.artistProfile.createProfile(
        auth1,
        'My Name',
        'taken_one',
      );

      final available = await endpoints.artistProfile.isHandleAvailable(
        auth1,
        'taken_one',
      );
      expect(available, isFalse);
    });

    test('rejects invalid handle format', () async {
      expect(
        () => endpoints.artistProfile.isHandleAvailable(auth1, 'AB'),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
