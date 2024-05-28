import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromRGBO(55, 54, 64, 1),
    primary: const Color.fromRGBO(55, 54, 64, 1),
    onPrimary: const Color.fromRGBO(126, 151, 166, 1),
    secondary: const Color.fromRGBO(99, 104, 110, 1),
    onSecondary: const Color.fromRGBO(182, 247, 193, 1),
  ),
  textTheme:  TextTheme(
    titleLarge: GoogleFonts.poppins(
      fontSize: 50,
      fontWeight: FontWeight.w700,
      color: const Color.fromRGBO(182, 247, 193, 1),
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 40,
      fontWeight: FontWeight.w700,
      color: const Color.fromRGBO(182, 247, 193, 1),
    ),
    titleSmall: GoogleFonts.poppins(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: const Color.fromRGBO(182, 247, 193, 1),
    ),
    bodyLarge: GoogleFonts.nunitoSans(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: const Color.fromRGBO(182, 247, 193, 1),
    ),
    bodyMedium: GoogleFonts.nunitoSans(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: const Color.fromRGBO(182, 247, 193, 1),
    ),
    bodySmall: GoogleFonts.nunitoSans(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: const Color.fromRGBO(182, 247, 193, 1),
    ),
  ),
);
