import 'package:go_router/go_router.dart';
import 'package:kylipp/config/router/routes.dart';
import 'package:kylipp/features/authentication/presentation/screens/log_in_screen.dart';
import 'package:kylipp/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:kylipp/features/user/presentation/screens/home_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: Routes.signInScreen,
      path: '/',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      name: Routes.logInScreen,
      path: Routes.logInScreen,
      builder: (context, state) => const LogInScreen(),
    ),
    GoRoute(
      name: Routes.homeScreen,
      path: Routes.homeScreen,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
