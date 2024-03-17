import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromRGBO(55, 54, 64, 1),
    primary: const Color.fromRGBO(55, 54, 64, 1),
    onPrimary: const Color.fromRGBO(126, 151, 166, 1),
    secondary: const Color.fromRGBO(99, 104, 110, 1),
    onSecondary: const Color.fromRGBO(182, 247, 193, 1),
  ),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.roboto(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: const Color.fromRGBO(182, 247, 193, 1),
    ),
    titleMedium: GoogleFonts.roboto(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: const Color.fromRGBO(182, 247, 193, 1),
    ),
    titleSmall: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: const Color.fromRGBO(182, 247, 193, 1),
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: const Color.fromRGBO(182, 247, 193, 1),
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: const Color.fromRGBO(182, 247, 193, 1),
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: const Color.fromRGBO(182, 247, 193, 1),
    ),
  ),
);
