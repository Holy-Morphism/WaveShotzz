import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageSwitchButton extends StatelessWidget {
  final String question, buttonText;
  final Function(int) switchPage;
  final int index;
  const PageSwitchButton({
    super.key,
    required this.question,
    required this.buttonText,
    required this.switchPage,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        TextButton(
            onPressed: () => switchPage(index),
            child: Text(buttonText,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSecondary,
                )))
      ],
    );
  }
}
