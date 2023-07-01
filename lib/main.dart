import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_reminder/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class AppRoutes {
  static const home = '/';
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
