import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_client/octattoo_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

import 'src/auth/sign_in_screen.dart';

late final Client client;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final serverUrl = await getServerUrl();
  client = Client(serverUrl)
    ..connectivityMonitor = FlutterConnectivityMonitor()
    ..authSessionManager = FlutterAuthSessionManager();
  client.auth.initialize();

  runApp(const OctattooApp());
}

final _router = GoRouter(
  initialLocation: '/appointments',
  redirect: (context, state) {
    final isAuthenticated = client.auth.isAuthenticated;
    final isOnAuth = state.matchedLocation == '/sign-in';
    if (!isAuthenticated && !isOnAuth) return '/sign-in';
    if (isAuthenticated && isOnAuth) return '/appointments';
    return null;
  },
  routes: [
    GoRoute(
      path: '/sign-in',
      builder: (context, state) => const SignInScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          AppShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/appointments',
            builder: (context, state) =>
                const PlaceholderScreen(title: 'Appointments'),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/customers',
            builder: (context, state) =>
                const PlaceholderScreen(title: 'Customers'),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/projects',
            builder: (context, state) =>
                const PlaceholderScreen(title: 'Projects'),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/profile',
            builder: (context, state) =>
                const PlaceholderScreen(title: 'Artist Profile'),
          ),
        ]),
      ],
    ),
  ],
);

class OctattooApp extends StatelessWidget {
  const OctattooApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'octattoo',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF6750A4),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: const Color(0xFF6750A4),
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      routerConfig: _router,
    );
  }
}

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('octattoo')),
      drawer: const AppDrawer(),
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) =>
            navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.calendar_today_outlined),
            selectedIcon: Icon(Icons.calendar_today),
            label: 'Appointments',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outlined),
            selectedIcon: Icon(Icons.people),
            label: 'Customers',
          ),
          NavigationDestination(
            icon: Icon(Icons.folder_outlined),
            selectedIcon: Icon(Icons.folder),
            label: 'Projects',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outlined),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: const Text('octattoo'),
          ),
          // Work
          const _DrawerSectionHeader(title: 'Work'),
          const ListTile(
            leading: Icon(Icons.inventory_2_outlined),
            title: Text('Inventory'),
          ),
          const ListTile(
            leading: Icon(Icons.location_on_outlined),
            title: Text('Workplaces'),
          ),
          const Divider(),
          // Finance
          const _DrawerSectionHeader(title: 'Finance'),
          const ListTile(
            leading: Icon(Icons.request_quote_outlined),
            title: Text('Quotes'),
          ),
          const ListTile(
            leading: Icon(Icons.receipt_long_outlined),
            title: Text('Invoices'),
          ),
          const Divider(),
          // Hygiene & Cleanliness
          const _DrawerSectionHeader(title: 'Hygiene & Cleanliness'),
          const ListTile(
            leading: Icon(Icons.search_outlined),
            title: Text('Recall Search'),
          ),
          const ListTile(
            leading: Icon(Icons.assignment_outlined),
            title: Text('Consent'),
          ),
          const Divider(),
          // Settings
          const _DrawerSectionHeader(title: 'Settings'),
          const ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}

class _DrawerSectionHeader extends StatelessWidget {
  const _DrawerSectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
