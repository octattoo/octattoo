import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('updateSeedColor', (sessionBuilder, endpoints) {
    test('persists seed color and generates palette', () async {
      final auth = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          '550e8400-e29b-41d4-a716-446655440099',
          {},
        ),
      );

      final profile = await endpoints.artistProfile.createProfile(
        auth,
        'Theme Artist',
        'theme_artist',
      );

      const seedColor = 0xFF6750A4;
      final updated = await endpoints.artistProfile.updateSeedColor(
        auth,
        profile.id!,
        seedColor,
      );

      expect(updated.seedColor, equals(seedColor));
      expect(updated.themeCssLight, isNotNull);
      expect(updated.themeCssLight, contains('--md-sys-color-primary'));
      expect(updated.themeCssDark, isNotNull);
      expect(updated.themeCssDark, contains('--md-sys-color-primary'));
    });

    test('null seed color clears palette', () async {
      final auth = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          '550e8400-e29b-41d4-a716-446655440098',
          {},
        ),
      );

      final profile = await endpoints.artistProfile.createProfile(
        auth,
        'Null Theme',
        'null_theme',
      );

      // First set a color
      await endpoints.artistProfile.updateSeedColor(
        auth,
        profile.id!,
        0xFF6750A4,
      );

      // Then clear it
      final cleared = await endpoints.artistProfile.updateSeedColor(
        auth,
        profile.id!,
        null,
      );

      expect(cleared.seedColor, isNull);
      expect(cleared.themeCssLight, isNull);
      expect(cleared.themeCssDark, isNull);
    });
  });
}
