import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:octattoo_flutter/main.dart';
import 'package:octattoo_flutter/src/profile/profile_switcher.dart';
import 'package:octattoo_flutter/src/theming/theme_viewmodel.dart';

void main() {
  group('ThemeViewModel', () {
    test('produces ColorScheme from seed color', () {
      final vm = ThemeViewModel();
      vm.setSeedColor(0xFF6750A4);

      expect(vm.lightTheme.colorScheme.primary, isNotNull);
      expect(vm.darkTheme.colorScheme.primary, isNotNull);
      expect(vm.darkTheme.brightness, Brightness.dark);
    });

    test('null seed color uses default theme', () {
      final vm = ThemeViewModel();
      vm.setSeedColor(null);

      expect(vm.lightTheme, isNotNull);
      expect(vm.darkTheme, isNotNull);
    });

    test('notifies listeners when seed color changes', () {
      final vm = ThemeViewModel();
      var notified = false;
      vm.addListener(() => notified = true);

      vm.setSeedColor(0xFFFF0000);
      expect(notified, isTrue);
    });

    test('theme changes when seed color changes', () {
      final vm = ThemeViewModel();
      vm.setSeedColor(0xFFFF0000);
      final redPrimary = vm.lightTheme.colorScheme.primary;

      vm.setSeedColor(0xFF00FF00);
      final greenPrimary = vm.lightTheme.colorScheme.primary;

      expect(redPrimary, isNot(equals(greenPrimary)));
    });

    test('reacts to profile switch via ProfileState', () {
      final state = ProfileState();
      final vm = ThemeViewModel();

      state.setProfiles([
        const ProfileEntry(
            id: '1', name: 'Red', handle: 'red', seedColor: 0xFFFF0000),
        const ProfileEntry(
            id: '2', name: 'Blue', handle: 'blue', seedColor: 0xFF0000FF),
      ]);

      // Wire: when profile switches, update theme
      state.addListener(() {
        final active = state.profiles.firstWhere(
          (p) => p.id == state.activeProfileId,
        );
        vm.setSeedColor(active.seedColor);
      });

      // Initial profile is '1' (Red)
      vm.setSeedColor(0xFFFF0000);
      final redPrimary = vm.lightTheme.colorScheme.primary;

      // Switch to Blue
      state.switchProfile('2');
      final bluePrimary = vm.lightTheme.colorScheme.primary;

      expect(redPrimary, isNot(equals(bluePrimary)));
    });
  });
}
