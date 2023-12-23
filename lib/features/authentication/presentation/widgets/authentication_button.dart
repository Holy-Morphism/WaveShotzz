import 'package:flutter/material.dart';

class AuthenticationButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const AuthenticationButton(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.redAccent,
        side: const BorderSide(width: 2, color: Colors.grey),
      ),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
