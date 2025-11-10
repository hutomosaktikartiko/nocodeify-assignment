import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nocodeify_assignment/features/main/presentation/pages/main_page.dart';

import 'features/chat/presentation/pages/chat_page.dart';
import 'features/dashboard/presentation/pages/dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
  }
}

final _router = GoRouter(
  initialLocation: '/dashboard',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainPage(child: child);
      },
      routes: [
        GoRoute(
          path: '/dashboard',
          builder: (context, state) {
            return const DashboardPage();
          },
        ),
        GoRoute(
          path: '/chat',
          builder: (context, state) {
            return const ChatPage();
          },
        ),
      ],
    ),
  ],
);
