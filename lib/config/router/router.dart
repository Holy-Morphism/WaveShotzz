import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:waveshotzz/config/router/routes.dart';
import 'package:waveshotzz/features/authentication/presentation/blocs/log_in_bloc/log_in_bloc.dart';
import 'package:waveshotzz/features/authentication/presentation/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:waveshotzz/features/authentication/presentation/screens/auth_screen.dart';
import 'package:waveshotzz/features/home/presentation/screens/home_screen.dart';
import 'package:waveshotzz/features/user_profile/presentation/bloc/user_profile_bloc/user_profile_bloc.dart';
import 'package:waveshotzz/features/user_profile/presentation/bloc/user_profile_bloc/user_profile_event.dart';
import 'package:waveshotzz/injection_container.dart';

final router = GoRouter(
  initialLocation: Routes.logInScreen,
  routes: [
    GoRoute(
      path: Routes.authPage,
      builder: (context, state) => MultiBlocProvider(providers: [
        BlocProvider<LogInBloc>(
          create: (context) => locator<LogInBloc>(),
        ),
        BlocProvider<SignInBloc>(
          create: (context) => locator<SignInBloc>(),
        ),
      ], child: const AuthenticationScreen()),
    ),
    //User Profile Page
    // GoRoute(
    //   path: Routes.userProfileScreen,
    //   builder: (context, state) => BlocProvider<UserProfileBloc>(
    //     create: (context) =>
    //         locator<UserProfileBloc>()..add(GetUserProfileEvent()),
    //     child: const UserProfileScreen(),
    //   ),
    // ),
    //home page
    GoRoute(
        path: Routes.homePage,
        builder: (context, state) => MultiBlocProvider(providers: [
              BlocProvider<UserProfileBloc>(
                create: (context) =>
                    locator<UserProfileBloc>()..add(GetUserProfileEvent()),
              ),
            ], child: const HomeScreen())),
  ],
  redirect: (context, state) {
    // Check if the user is already signed in
    if (locator<FirebaseAuth>().currentUser != null) {
      // If the user is signed in, redirect them to the UserProfileScreen
      return Routes.homePage;
    } else {
      // If the user is not signed in, redirect them to the SignInScreen
      return Routes.authPage;
    }
  },
);
