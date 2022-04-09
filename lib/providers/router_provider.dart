import 'package:firebase_auth/firebase_auth.dart';
import 'package:firechats/app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';

final authProvider = Provider((ref) => FirebaseAuth.instance);

final routerProvider = Provider((ref) {
  final auth = ref.watch(authProvider);

  return GoRouter(
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
          return Container();
        },
      ),
      GoRoute(
        path: '/',
        builder: (_, __) => const MainIndexed(),
      ),
    ],
  );
});
