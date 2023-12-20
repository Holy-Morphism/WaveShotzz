import 'package:go_router/go_router.dart';
import 'package:waveshotzz/config/router/routes.dart';
import 'package:waveshotzz/features/authentication/presentation/screens/log_in_screen.dart';
import 'package:waveshotzz/features/authentication/presentation/screens/sign_in_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: Routes.logInScreen,
      builder: (context, state) => const LogInScreen(),
    ),
    GoRoute(
      path: Routes.logInScreen,
      builder: (context, state) => const LogInScreen(),
    ),
  ],
);
