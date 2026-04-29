import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:octattoo_flutter/main.dart';

void main() {
  testWidgets('AppShell shows 4 bottom nav destinations', (tester) async {
    await tester.pumpWidget(const OctattooApp());
    await tester.pumpAndSettle();

    expect(find.text('Appointments'), findsWidgets);
    expect(find.text('Customers'), findsOneWidget);
    expect(find.text('Projects'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
  });

  testWidgets('Bottom nav switches tabs', (tester) async {
    await tester.pumpWidget(const OctattooApp());
    await tester.pumpAndSettle();

    // Initially on Appointments
    expect(find.text('Appointments'), findsWidgets);

    // Tap Customers tab
    await tester.tap(find.text('Customers'));
    await tester.pumpAndSettle();
    // The Customers placeholder screen should be visible
    expect(find.text('Customers'), findsWidgets);
  });

  testWidgets('Drawer opens and shows grouped sections', (tester) async {
    await tester.pumpWidget(const OctattooApp());
    await tester.pumpAndSettle();

    // Open drawer via scaffold
    final scaffoldState =
        tester.firstState<ScaffoldState>(find.byType(Scaffold));
    scaffoldState.openDrawer();
    await tester.pumpAndSettle();

    expect(find.text('Work'), findsOneWidget);
    expect(find.text('Finance'), findsOneWidget);
    expect(find.text('Hygiene & Cleanliness'), findsOneWidget);
    expect(find.text('Inventory'), findsOneWidget);
  });
}
