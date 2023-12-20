import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waveshotzz/config/router/router.dart';
import 'package:waveshotzz/config/theme/theme.dart';
import 'package:waveshotzz/features/authentication/presentation/bloc/authentication_bloc.dart';

import 'firebase_options.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDependencies();
  runApp(const WaveShotzz());
}

class WaveShotzz extends StatelessWidget {
  const WaveShotzz({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) => locator()..isSignedIn,
      child: MaterialApp.router(
        title: 'WaveShotzz',
        debugShowCheckedModeBanner: false,
        theme: theme,
        routerConfig: router,
      ),
    );
  }
}
