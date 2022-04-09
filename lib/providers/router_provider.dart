import 'package:firebase_auth/firebase_auth.dart';
import 'package:firechats/app.dart';
import 'package:firechats/pages/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';

final authProvider = Provider((ref) {
  return FirebaseAuth.instance;
});

final userProvider = StreamProvider((ref) {
  return ref.watch(authProvider).userChanges();
});

final routerProvider = Provider((ref) {
  final auth = ref.watch(authProvider);

  const scaffoldKey = ValueKey('appScaffold');
  final router = GoRouter(
    redirect: (state) {
      const skips = ['/login'];
      if (auth.currentUser != null || skips.contains(state.subloc)) {
        return null; // pass through
      }
      return '/login';
    },
    redirectLimit: 3,
    routes: [
      GoRoute(
        path: '/login',
        builder: (_, __) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: '/',
        redirect: (_) => '/chats',
      ),
      GoRoute(
        path: '/chats',
        pageBuilder: (_, __) => FadeTransitionPage(
          key: scaffoldKey,
          child: const AppScaffold(
            selectedTab: AppTabs.chats,
          ),
        ),
      ),
      GoRoute(
        path: '/contacts',
        pageBuilder: (_, __) => FadeTransitionPage(
          key: scaffoldKey,
          child: const AppScaffold(
            selectedTab: AppTabs.contacts,
          ),
        ),
      ),
      GoRoute(
        path: '/profiles',
        pageBuilder: (_, __) => FadeTransitionPage(
          key: scaffoldKey,
          child: const AppScaffold(
            selectedTab: AppTabs.profiles,
          ),
        ),
      ),
    ],
  );

  return router;
});

class FadeTransitionPage extends CustomTransitionPage<void> {
  FadeTransitionPage({
    required LocalKey key,
    required Widget child,
  }) : super(
          key: key,
          child: child,
          transitionsBuilder: (_, anime, __, child) => FadeTransition(
            opacity: CurvedAnimation(
              curve: Curves.easeIn,
              parent: anime,
            ),
            child: child,
          ),
        );
}
