import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:octattoo_client/octattoo_client.dart';
import 'package:octattoo_flutter/main.dart';
import 'package:octattoo_flutter/src/auth/sign_in_screen.dart';

void main() {
  setUp(() {
    client = Client('http://localhost:8080/');
  });

  testWidgets('SignInScreen shows email and password fields', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: SignInScreen(showGoogleSignIn: false)),
    );

    expect(find.byType(TextField), findsAtLeast(2));
    expect(find.text('Sign in'), findsOneWidget);
  });

  testWidgets('SignInScreen shows sign-up link', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: SignInScreen(showGoogleSignIn: false)),
    );

    expect(find.text('Create account'), findsOneWidget);
  });
}
