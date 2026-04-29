import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_flutter/main.dart';

void main() {
  testWidgets('AppShell shows 4 bottom nav destinations', (tester) async {
    final router = GoRouter(
      initialLocation: '/appointments',
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              AppShell(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/appointments',
                  builder: (_, _) =>
                      const PlaceholderScreen(title: 'Appointments'),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/customers',
                  builder: (_, _) =>
                      const PlaceholderScreen(title: 'Customers'),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/projects',
                  builder: (_, _) => const PlaceholderScreen(title: 'Projects'),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/profile',
                  builder: (_, _) =>
                      const PlaceholderScreen(title: 'Artist Profile'),
                ),
              ],
            ),
          ],
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pumpAndSettle();

    expect(find.text('Appointments'), findsWidgets);
    expect(find.text('Customers'), findsOneWidget);
    expect(find.text('Projects'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
  });

  testWidgets('Bottom nav switches tabs', (tester) async {
    final router = GoRouter(
      initialLocation: '/appointments',
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              AppShell(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/appointments',
                  builder: (_, _) =>
                      const PlaceholderScreen(title: 'Appointments'),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/customers',
                  builder: (_, _) =>
                      const PlaceholderScreen(title: 'Customers'),
                ),
              ],
            ),
          ],
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pumpAndSettle();

    expect(find.text('Appointments'), findsWidgets);

    await tester.tap(find.text('Customers'));
    await tester.pumpAndSettle();
    expect(find.text('Customers'), findsWidgets);
  });

  testWidgets('Drawer opens and shows grouped sections', (tester) async {
    final router = GoRouter(
      initialLocation: '/appointments',
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              AppShell(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/appointments',
                  builder: (_, _) =>
                      const PlaceholderScreen(title: 'Appointments'),
                ),
              ],
            ),
          ],
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pumpAndSettle();

    final scaffoldState = tester.firstState<ScaffoldState>(
      find.byType(Scaffold),
    );
    scaffoldState.openDrawer();
    await tester.pumpAndSettle();

    expect(find.text('Work'), findsOneWidget);
    expect(find.text('Finance'), findsOneWidget);
    expect(find.text('Hygiene & Cleanliness'), findsOneWidget);
    expect(find.text('Inventory'), findsOneWidget);
  });
}
