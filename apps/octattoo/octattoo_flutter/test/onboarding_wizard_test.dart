import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:octattoo_flutter/src/onboarding/onboarding_wizard.dart';

void main() {
  group('OnboardingWizard', () {
    testWidgets('starts on profile name step', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: OnboardingWizard(onComplete: (_) {})),
      );

      expect(find.text('Profile name'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('cannot advance without name', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: OnboardingWizard(onComplete: (_) {})),
      );

      await tester.tap(find.text('Next'));
      await tester.pump();

      // Still on name step
      expect(find.text('Profile name'), findsOneWidget);
    });

    testWidgets('advances to handle step after entering name', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: OnboardingWizard(onComplete: (_) {})),
      );

      await tester.enterText(find.byType(TextField), 'Alice Ink');
      await tester.tap(find.text('Next'));
      await tester.pump();

      expect(find.text('Handle'), findsOneWidget);
    });

    testWidgets('handle step shows suggestion from name', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: OnboardingWizard(onComplete: (_) {})),
      );

      await tester.enterText(find.byType(TextField), 'Alice Ink');
      await tester.tap(find.text('Next'));
      await tester.pump();

      // Handle field should be pre-filled with suggestion
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.controller!.text, equals('alice_ink'));
    });

    testWidgets('completes wizard with name and handle', (tester) async {
      String? completedName;
      String? completedHandle;

      await tester.pumpWidget(
        MaterialApp(
          home: OnboardingWizard(
            onComplete: (result) {
              completedName = result.name;
              completedHandle = result.handle;
            },
          ),
        ),
      );

      // Step 1: name
      await tester.enterText(find.byType(TextField), 'Alice Ink');
      await tester.tap(find.text('Next'));
      await tester.pump();

      // Step 2: handle (accept suggestion)
      await tester.tap(find.text('Finish'));
      await tester.pump();

      expect(completedName, equals('Alice Ink'));
      expect(completedHandle, equals('alice_ink'));
    });

    testWidgets('can go back from handle to name', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: OnboardingWizard(onComplete: (_) {})),
      );

      await tester.enterText(find.byType(TextField), 'Alice Ink');
      await tester.tap(find.text('Next'));
      await tester.pump();

      await tester.tap(find.text('Back'));
      await tester.pump();

      expect(find.text('Profile name'), findsOneWidget);
    });
  });
}
