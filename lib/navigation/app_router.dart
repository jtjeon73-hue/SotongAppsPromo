import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../layout/app_shell.dart';
import '../screens/about_page.dart';
import '../screens/apps_page.dart';
import '../screens/contact_page.dart';
import '../screens/developing_apps_page.dart';
import '../screens/faq_page.dart';
import '../screens/features_page.dart';
import '../screens/home_screen.dart';
import '../screens/launched_apps_page.dart';
import '../screens/process_page.dart';
import '../screens/updates_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);

GoRouter createAppRouter() {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomeScreen()),
          ),
          GoRoute(
            path: '/about',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: AboutPage()),
          ),
          GoRoute(
            path: '/apps',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: AppsPage()),
          ),
          GoRoute(
            path: '/launched',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: LaunchedAppsPage()),
          ),
          GoRoute(
            path: '/developing',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: DevelopingAppsPage()),
          ),
          GoRoute(
            path: '/features',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: FeaturesPage()),
          ),
          GoRoute(
            path: '/process',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ProcessPage()),
          ),
          GoRoute(
            path: '/updates',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: UpdatesPage()),
          ),
          GoRoute(
            path: '/faq',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: FaqPage()),
          ),
          GoRoute(
            path: '/contact',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ContactPage()),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('페이지를 찾을 수 없습니다'),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => context.go('/'),
              child: const Text('홈으로'),
            ),
          ],
        ),
      ),
    ),
  );
}
