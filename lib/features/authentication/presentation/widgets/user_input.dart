import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  const UserInput(
      {super.key,
      required this.textEditingController,
      this.isPass = false,
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
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            width: 3,
            color: Colors.white,
          ),
        ),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            width: 3,
            color: Colors.white,
          ),
        ),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
