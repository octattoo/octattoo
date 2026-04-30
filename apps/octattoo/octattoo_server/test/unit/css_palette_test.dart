import 'package:test/test.dart';

import 'package:octattoo_server/src/theming/css_palette.dart';

void main() {
  group('generateCssPalette', () {
    test('is deterministic — same seed produces same output', () {
      const seed = 0xFF6750A4;
      final first = generateCssPalette(seed);
      final second = generateCssPalette(seed);
      expect(first, equals(second));
    });

    test('light output contains expected MD3 custom properties', () {
      const seed = 0xFF6750A4;
      final result = generateCssPalette(seed);

      final requiredTokens = [
        '--md-sys-color-primary',
        '--md-sys-color-on-primary',
        '--md-sys-color-primary-container',
        '--md-sys-color-secondary',
        '--md-sys-color-tertiary',
        '--md-sys-color-error',
        '--md-sys-color-surface',
        '--md-sys-color-on-surface',
        '--md-sys-color-outline',
      ];

      for (final token in requiredTokens) {
        expect(result.light, contains(token), reason: 'missing $token');
      }
    });

    test('dark output contains expected MD3 custom properties', () {
      const seed = 0xFF6750A4;
      final result = generateCssPalette(seed);

      final requiredTokens = [
        '--md-sys-color-primary',
        '--md-sys-color-on-primary',
        '--md-sys-color-surface',
        '--md-sys-color-on-surface',
      ];

      for (final token in requiredTokens) {
        expect(result.dark, contains(token), reason: 'missing $token');
      }
    });

    test('values are valid hex colors', () {
      const seed = 0xFF6750A4;
      final result = generateCssPalette(seed);
      final hexPattern = RegExp(r'#[0-9a-f]{6}');
      expect(hexPattern.hasMatch(result.light), isTrue);
      expect(hexPattern.hasMatch(result.dark), isTrue);
    });
  });
}
