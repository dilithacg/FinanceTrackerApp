import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../bottom_nav_bar_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  redirect: (BuildContext context, GoRouterState state) {
    final user = FirebaseAuth.instance.currentUser;

    final loggingIn = state.uri.path == '/';

    // Redirect logged-in user from login to home
    if (user != null && loggingIn) return '/home';

    // Redirect non-logged-in user trying to access home
    if (user == null && state.uri.path == '/home') return '/';

    // No redirection
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const BottomNavBarScreen(),
    ),
  ],
);
