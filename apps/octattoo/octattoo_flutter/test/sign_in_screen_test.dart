import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:octattoo_flutter/src/auth/sign_in_screen.dart';

void main() {
  testWidgets('SignInScreen shows email and password fields', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: SignInScreen()),
    );

    expect(find.byType(TextField), findsAtLeast(2));
    expect(find.text('Sign in'), findsOneWidget);
  });

  testWidgets('SignInScreen shows sign-up link', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: SignInScreen()),
    );

    expect(find.text('Create account'), findsOneWidget);
  });
}
