import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageSwitchButton extends StatelessWidget {
  final String question, buttonText, switchPath;
  const PageSwitchButton(
      {super.key,
      required this.question,
      required this.buttonText,
      required this.switchPath});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
        ),
        TextButton(
            onPressed: () => context.go(switchPath),
            child: Text(
              buttonText,
            ))
      ],
    );
  }
}
