import 'package:material_color_utilities/material_color_utilities.dart';

/// Generates CSS custom properties for light and dark MD3 color schemes
/// from an ARGB seed color integer.
///
/// Returns a record with `light` and `dark` CSS strings.
({String light, String dark}) generateCssPalette(int seedColor) {
  final scheme = SchemeFidelity(
    sourceColorHct: Hct.fromInt(seedColor),
    isDark: false,
    contrastLevel: 0.0,
  );
  final darkScheme = SchemeFidelity(
    sourceColorHct: Hct.fromInt(seedColor),
    isDark: true,
    contrastLevel: 0.0,
  );

  return (
    light: _toCustomProperties(scheme),
    dark: _toCustomProperties(darkScheme),
  );
}

String _toCustomProperties(DynamicScheme scheme) {
  final tokens = {
    'primary': MaterialDynamicColors.primary.getArgb(scheme),
    'on-primary': MaterialDynamicColors.onPrimary.getArgb(scheme),
    'primary-container': MaterialDynamicColors.primaryContainer.getArgb(scheme),
    'on-primary-container':
        MaterialDynamicColors.onPrimaryContainer.getArgb(scheme),
    'secondary': MaterialDynamicColors.secondary.getArgb(scheme),
    'on-secondary': MaterialDynamicColors.onSecondary.getArgb(scheme),
    'secondary-container':
        MaterialDynamicColors.secondaryContainer.getArgb(scheme),
    'on-secondary-container':
        MaterialDynamicColors.onSecondaryContainer.getArgb(scheme),
    'tertiary': MaterialDynamicColors.tertiary.getArgb(scheme),
    'on-tertiary': MaterialDynamicColors.onTertiary.getArgb(scheme),
    'tertiary-container':
        MaterialDynamicColors.tertiaryContainer.getArgb(scheme),
    'on-tertiary-container':
        MaterialDynamicColors.onTertiaryContainer.getArgb(scheme),
    'error': MaterialDynamicColors.error.getArgb(scheme),
    'on-error': MaterialDynamicColors.onError.getArgb(scheme),
    'error-container': MaterialDynamicColors.errorContainer.getArgb(scheme),
    'on-error-container':
        MaterialDynamicColors.onErrorContainer.getArgb(scheme),
    'surface': MaterialDynamicColors.surface.getArgb(scheme),
    'on-surface': MaterialDynamicColors.onSurface.getArgb(scheme),
    'surface-container':
        MaterialDynamicColors.surfaceContainer.getArgb(scheme),
    'on-surface-variant':
        MaterialDynamicColors.onSurfaceVariant.getArgb(scheme),
    'outline': MaterialDynamicColors.outline.getArgb(scheme),
    'outline-variant': MaterialDynamicColors.outlineVariant.getArgb(scheme),
  };

  final buffer = StringBuffer();
  for (final entry in tokens.entries) {
    final hex = _argbToHex(entry.value);
    buffer.writeln('  --md-sys-color-${entry.key}: $hex;');
  }
  return buffer.toString().trimRight();
}

String _argbToHex(int argb) {
  final r = (argb >> 16) & 0xFF;
  final g = (argb >> 8) & 0xFF;
  final b = argb & 0xFF;
  return '#${r.toRadixString(16).padLeft(2, '0')}'
      '${g.toRadixString(16).padLeft(2, '0')}'
      '${b.toRadixString(16).padLeft(2, '0')}';
}
