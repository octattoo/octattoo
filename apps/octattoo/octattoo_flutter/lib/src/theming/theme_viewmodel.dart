import 'package:flutter/material.dart';

/// ViewModel that produces ThemeData from a seed color.
class ThemeViewModel extends ChangeNotifier {
  static const _defaultSeedValue = 0xFF6750A4;

  int? _seedColor;

  ThemeData get lightTheme => ThemeData(
        colorSchemeSeed: Color(_seedColor ?? _defaultSeedValue),
        useMaterial3: true,
      );

  ThemeData get darkTheme => ThemeData(
        colorSchemeSeed: Color(_seedColor ?? _defaultSeedValue),
        useMaterial3: true,
        brightness: Brightness.dark,
      );

  void setSeedColor(int? seedColor) {
    _seedColor = seedColor;
    notifyListeners();
  }
}
