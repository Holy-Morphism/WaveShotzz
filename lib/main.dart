import 'package:flutter/material.dart';
import 'package:kylipp/config/router/router.dart';
import 'package:kylipp/config/theme/theme.dart';

void main() {
  runApp(const KYLIPP());
}

class KYLIPP extends StatelessWidget {
  const KYLIPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: theme,
      routerConfig: router,
    );
  }
}
