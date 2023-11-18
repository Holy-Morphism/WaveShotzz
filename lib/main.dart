import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:kylipp/previous/providers/posts_of_following_provider.dart';
import 'package:kylipp/previous/providers/user_provider.dart';
import 'package:kylipp/previous/providers/users_provider.dart';
import 'package:kylipp/previous/screens/chat_screen.dart';

import 'package:kylipp/previous/screens/messages_screen.dart';
import 'package:kylipp/previous/screens/explore_post_detail.dart';
import 'package:kylipp/previous/screens/home_screen.dart';
import 'package:kylipp/previous/screens/login_screen.dart';
import 'package:kylipp/previous/screens/other_profile_screen.dart';
import 'package:kylipp/previous/screens/profile_post_detail.dart';
import 'package:kylipp/previous/screens/post_screen.dart';
import 'package:kylipp/previous/screens/signup_screen.dart';
import 'package:provider/provider.dart';

import 'previous/firebase/auth.dart';
import 'firebase_options.dart';

void main() {
  runApp(const KYLIPP());
}

class KYLIPP extends StatelessWidget {
  const KYLIPP({super.key});

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
              ChangeNotifierProvider(create: (_) => UserProvider()),
              ChangeNotifierProvider(create: (_) => PostOfFollowingProvider()),
              ChangeNotifierProvider(create: (_) => UsersProvider()),
            ],
            builder: (context, child) => MaterialApp(
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
                PostScreen.routeName: (context) => PostScreen(),
                MessagesScreen.routeName: (context) => const MessagesScreen(),
                ProfilePostDetails.routeName: (context) =>
                    const ProfilePostDetails(),
                PostDetails.routeName: (context) => const PostDetails(),
                OtherProfileScreen.routeName: (context) =>
                    const OtherProfileScreen(),
                ChatScreen.routeName: (context) => const ChatScreen()
              },
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return materialApp(
            child: const CircularProgressIndicator(
          color: Colors.redAccent,
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
