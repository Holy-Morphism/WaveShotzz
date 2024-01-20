import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:waveshotzz/config/router/routes.dart';
import 'package:waveshotzz/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:waveshotzz/features/authentication/presentation/screens/auth_page.dart';
import 'package:waveshotzz/features/user_profile/presentation/bloc/user_profile_bloc/user_profile_bloc.dart';
import 'package:waveshotzz/features/user_profile/presentation/bloc/user_profile_bloc/user_profile_event.dart';
import 'package:waveshotzz/features/user_profile/presentation/screens/user_profile_screen.dart';
import 'package:waveshotzz/injection_container.dart';

final router = GoRouter(
  initialLocation: Routes.logInScreen,
  routes: [
    GoRoute(
      path: Routes.authPage,
      builder: (context, state) => BlocProvider<AuthenticationBloc>(
          create: (context) => locator<AuthenticationBloc>(),
          child: const AuthenticationPage()),
    ),
    GoRoute(
      path: Routes.userProfileScreen,
      builder: (context, state) => BlocProvider<UserProfileBloc>(
        create: (context) =>
            locator<UserProfileBloc>()..add(GetUserProfileEvent()),
        child: const UserProfileScreen(),
      ),
    ),
  ],
  redirect: (context, state) {
    // Check if the user is already signed in
    if (locator<FirebaseAuth>().currentUser != null) {
      // If the user is signed in, redirect them to the UserProfileScreen
      return Routes.userProfileScreen;
    } else {
      // If the user is not signed in, redirect them to the SignInScreen
      return Routes.authPage;
    }
  },
);
