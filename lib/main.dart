import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kylipp/config/theme/theme.dart';
import 'package:kylipp/features/authentication/presentation/screens/log_in_screen.dart';

import 'firebase_options.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initializeDependencies();

  runApp(const KYLIPP());
}

class FirebaseAppCheck {}

class KYLIPP extends StatelessWidget {
  const KYLIPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const LogInScreen(),
    );
  }
}
