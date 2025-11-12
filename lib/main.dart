import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/constants/app_theme.dart';
import 'features/account/presentation/pages/account_facebook_page.dart';
import 'features/account/presentation/pages/account_instagram_page.dart';
import 'features/chat/presentation/pages/chat_all_page.dart';
import 'features/chat/presentation/pages/chat_instagram_page.dart';
import 'features/chat/presentation/pages/chat_sheel_page.dart';
import 'features/dashboard/presentation/pages/dashboard_page.dart';
import 'features/loading/presentation/bloc/full_screen_loading_cubit.dart';
import 'features/loading/presentation/pages/full_screen_loading_page.dart';
import 'features/main/presentation/pages/main_shell_page.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // --- ENV ---
  await dotenv.load(fileName: '.env');

  // --- SUPABASE ---
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? '',
    anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? '',
  );

  // --- INJECTION ---
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<FullScreenLoadingCubit>()),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
        theme: appTheme(context),
        scrollBehavior: AppScrollBehavior(),
        builder: (context, child) {
          return Stack(
            children: [
              if (child != null) child,
              BlocBuilder<FullScreenLoadingCubit, FullScreenLoadingState>(
                builder: (context, state) {
                  if (state is ShowFullScreenLoading) {
                    return FullScreenLoadingPage(message: state.message);
                  }

                  return const SizedBox.shrink();
                },
              ),
            ],
          );
        },
      ),
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
