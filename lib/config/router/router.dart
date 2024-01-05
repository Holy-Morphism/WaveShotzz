import 'package:go_router/go_router.dart';
import 'package:waveshotzz/config/router/routes.dart';
import 'package:waveshotzz/features/authentication/presentation/screens/log_in_screen.dart';
import 'package:waveshotzz/features/authentication/presentation/screens/sign_in_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
<<<<<<< HEAD
=======
      name: Routes.signInScreen,
>>>>>>> 4376f40 (login,signup routing added)
      path: '/',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
<<<<<<< HEAD
=======
      name: Routes.logInScreen,
>>>>>>> 4376f40 (login,signup routing added)
      path: Routes.logInScreen,
      builder: (context, state) => const LogInScreen(),
    ),
  ],
);
