import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kylipp/providers/current_user.dart';
import 'package:kylipp/providers/explore_post_provider.dart';
import 'package:kylipp/providers/home_post_provider.dart';
import 'package:kylipp/screens/chat_screen.dart';
import 'package:kylipp/screens/explore_post_detail.dart';
import 'package:kylipp/screens/explore_screen.dart';
import 'package:kylipp/screens/home_screen.dart';
import 'package:kylipp/screens/login_screen.dart';
import 'package:kylipp/screens/notifications_page.dart';
import 'package:kylipp/screens/profile_post_detail.dart';
import 'package:kylipp/screens/post_screen.dart';
import 'package:kylipp/screens/profile_screen.dart';
import 'package:kylipp/screens/signup_screen.dart';
import 'package:provider/provider.dart';

import 'constants/constants.dart';
import 'firebase/auth.dart';
import 'firebase/firebase_options.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return materialApp(child: Text(snapshot.error.toString()));
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => CurrentUserProvider()),
              ChangeNotifierProvider(create: (_) => ExplorePostProvider()),
              ChangeNotifierProvider(create: (_) => HomePostProvider())
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'KYLIPP',
              theme: ThemeData.dark(useMaterial3: true),
              home: AuthMethods.userLoggedIn()
                  ? const HomeScreen()
                  : const LoginScreen(),
              routes: {
                LoginScreen.routeName: (context) => const LoginScreen(),
                SignupScreen.routeName: (context) => const SignupScreen(),
                HomeScreen.routeName: (context) => const HomeScreen(),
                ExploreScreen.routeName: (context) => const ExploreScreen(),
                NotificationsScreen.routeName: (context) =>
                    const NotificationsScreen(),
                ProfileScreen.routeName: (context) => const ProfileScreen(),
                PostScreen.routeName: (context) => PostScreen(),
                ChatScreen.routeName: (context) => const ChatScreen(),
                ProfilePostDetails.routeName: (context) =>
                    const ProfilePostDetails(),
                ExplorePostDetails.routeName: (context) =>
                    const ExplorePostDetails()
              },
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return materialApp(
            child: SizedBox.expand(
          child: Image.asset(
            gfLoading,
            fit: BoxFit.cover,
          ),
        ));
      },
    );
  }
}

MaterialApp materialApp({required Widget child}) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'KYLIPP',
    theme: ThemeData.dark(useMaterial3: true),
    home: Scaffold(
      body: Center(
        child: child,
      ),
    ),
  );
}
