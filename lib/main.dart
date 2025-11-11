import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/constants/app_theme.dart';
import 'features/account/presentation/pages/account_facebook_page.dart';
import 'features/account/presentation/pages/account_instagram_page.dart';
import 'features/chat/presentation/pages/chat_all_page.dart';
import 'features/chat/presentation/pages/chat_instagram_page.dart';
import 'features/chat/presentation/pages/chat_sheel_page.dart';
import 'features/dashboard/presentation/pages/dashboard_page.dart';
import 'features/main/presentation/pages/main_shell_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: appTheme(context),
      scrollBehavior: AppScrollBehavior(),
    );
  }
}

final _router = GoRouter(
  initialLocation: '/dashboard',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainShellPage(child: child);
      },
      routes: [
        GoRoute(
          path: '/dashboard',
          builder: (context, state) {
            return const DashboardPage();
          },
        ),
        GoRoute(
          path: '/accounts/instagram',
          builder: (context, state) {
            return const AccountInstagramPage();
          },
        ),
        GoRoute(
          path: '/accounts/facebook',
          builder: (context, state) {
            return const AccountFacebookPage();
          },
        ),
        ShellRoute(
          builder: (context, state, child) {
            return ChatSheelPage(child: child);
          },
          routes: [
            GoRoute(
              path: '/chat/all',
              builder: (context, state) {
                return const ChatAllPage();
              },
            ),
            GoRoute(
              path: '/chat/instagram',
              builder: (context, state) {
                return const ChatInstagramPage();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.stylus,
    PointerDeviceKind.trackpad,
  };
}
