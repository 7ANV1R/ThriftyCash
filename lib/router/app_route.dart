import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenPaths {
  static String splash = '/';
  static String intro = '/welcome';
  static String home = '/home';
  static String auth = '/auth';
}

final appRouter = GoRouter(
  initialLocation: ScreenPaths.auth,
  routes: [
    GoRoute(
      path: ScreenPaths.auth,
      builder: (context, state) {
        return Container();
      },
    ),
  ],
);
