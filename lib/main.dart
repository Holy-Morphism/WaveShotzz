import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kylipp/config/router/router.dart';
import 'package:kylipp/config/theme/theme.dart';
import 'package:kylipp/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:kylipp/injection_container.dart';

void main() {
  runApp(const KYLIPP());
}

class KYLIPP extends StatelessWidget {
  const KYLIPP({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) => locator()..isSignedIn,
      child: MaterialApp.router(
        theme: theme,
        routerConfig: router,
      ),
    );
  }
}
