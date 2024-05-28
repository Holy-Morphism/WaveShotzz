import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthenticationButton extends StatefulWidget {
  final VoidCallback onPressed;
  final bool disabled;
  final String title;
  const AuthenticationButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.disabled = false});

  @override
  State<AuthenticationButton> createState() => _AuthenticationButtonState();
}

class _AuthenticationButtonState extends State<AuthenticationButton> {
  bool isPressed = false;
  onTap() {
    setState(() {
      isPressed = !isPressed;
    });
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        isPressed = !isPressed;
      });
      widget.onPressed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 100),
        width: double.infinity,
        height: 60,
        decoration: !isPressed && !widget.disabled
            ? BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    blurRadius: 4,
                    spreadRadius: 1,
                    offset: const Offset(-2, -2),
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.9),
                    blurRadius: 4,
                    spreadRadius: 1,
                    blurStyle: BlurStyle.inner,
                    offset: const Offset(2, 3),
                  ),
                ],
              )
            : BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
        child: Center(
          child: Text(
            widget.title,
            style: GoogleFonts.nunitoSans(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
