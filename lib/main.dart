import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kylipp/config/router/router.dart';
import 'package:kylipp/config/theme/theme.dart';
import 'package:kylipp/features/authentication/presentation/bloc/authentication_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => locator()..isSignedIn,
        ),
      ],
      child: MaterialApp.router(
        theme: theme,
        routerConfig: router,
      ),
    );
  }
}
