import 'package:flutter/material.dart';
import 'package:kylipp/config/theme/theme.dart';
import 'package:kylipp/features/authentication/presentation/screens/log_in_screen.dart';

void main() {
  runApp(const KYLIPP());
}

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
