import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserInput extends StatelessWidget {
  // final Function(String) onChanged;
  const UserInput(
      {super.key,
      required this.textEditingController,
      this.isPass = false,
      //  required this.onChanged,
      required this.textInputType,
      required this.hintText,
      required this.label});
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.8),
            blurRadius: 4,
            spreadRadius: 1,
            blurStyle: BlurStyle.outer,
            offset: const Offset(-2, -2),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            spreadRadius: 1,
            blurStyle: BlurStyle.inner,
            offset: const Offset(2, 2),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            blurRadius: 4,
            spreadRadius: 1,
            blurStyle: BlurStyle.inner,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: TextFormField(
        cursorColor: Colors.grey.shade900,
        controller: textEditingController,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: label,
          labelStyle: GoogleFonts.nunitoSans(
            color: Theme.of(context).colorScheme.secondary,
          ),
          border: InputBorder.none,
        ),
        keyboardType: textInputType,
        obscureText: isPass,
      ),
    );
  }
}
