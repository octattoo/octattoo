import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:octattoo_flutter/src/profile/profile_switcher.dart';

void main() {
  group('ProfileSwitcher', () {
    testWidgets('shows current profile name', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              actions: [
                ProfileSwitcher(
                  profiles: const [
                    ProfileEntry(id: '1', name: 'Alice Ink', handle: 'alice_ink'),
                    ProfileEntry(id: '2', name: 'Bob Art', handle: 'bob_art'),
                  ],
                  activeProfileId: '1',
                  onSwitch: (_) {},
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Alice Ink'), findsOneWidget);
    });

    testWidgets('shows dropdown with all profiles on tap', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              actions: [
                ProfileSwitcher(
                  profiles: const [
                    ProfileEntry(id: '1', name: 'Alice Ink', handle: 'alice_ink'),
                    ProfileEntry(id: '2', name: 'Bob Art', handle: 'bob_art'),
                  ],
                  activeProfileId: '1',
                  onSwitch: (_) {},
                ),
              ],
            ),
          ),
        ),
      );

      await tester.tap(find.text('Alice Ink'));
      await tester.pumpAndSettle();

      expect(find.text('Bob Art'), findsOneWidget);
    });

    testWidgets('calls onSwitch with selected profile id', (tester) async {
      String? switchedTo;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              actions: [
                ProfileSwitcher(
                  profiles: const [
                    ProfileEntry(id: '1', name: 'Alice Ink', handle: 'alice_ink'),
                    ProfileEntry(id: '2', name: 'Bob Art', handle: 'bob_art'),
                  ],
                  activeProfileId: '1',
                  onSwitch: (id) => switchedTo = id,
                ),
              ],
            ),
          ),
        ),
      );

      await tester.tap(find.text('Alice Ink'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Bob Art').last);
      await tester.pumpAndSettle();

      expect(switchedTo, equals('2'));
    });
  });
}
