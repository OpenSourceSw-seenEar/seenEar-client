import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seenear/main.dart';
import 'package:seenear/src/features/common/splash/splash_screen.dart';

final configRouter = GoRouter(
  initialLocation: "/splash",
  routes: [
    GoRoute(
        path: "/splash",
        name: "/splash",
        pageBuilder: (context, state) =>
            const MaterialPage(child: SplashScreen())),
    GoRoute(
      path: "/",
      name: "/",
      pageBuilder: (context, state) => const MaterialPage(child: MainScreen()),
    ),
  ],
);
