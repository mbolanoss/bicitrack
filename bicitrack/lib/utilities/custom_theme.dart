import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const cream = Color(0xFFDAF0EE);
const green = Color(0xFF2BA84A);
const seablue = Color(0xFF086375);
const red = Color(0xFFF03A47);
const purple = Color(0xFF52154E);

ThemeData lightTheme = ThemeData(
  useMaterial3: true,

  colorScheme: ColorScheme.light().copyWith(background: cream),

  // Botones flotantes
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: purple,
    foregroundColor: Colors.white,
    iconSize: 30,
  ),

  // Botones
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      backgroundColor: MaterialStateProperty.all(green),
    ),
  ),

  // Textos
  textTheme: TextTheme(
    // Titulo
    displayLarge: GoogleFonts.nunito(
      fontWeight: FontWeight.bold,
      fontSize: 60,
    ),
    // Subtitulo
    displayMedium: GoogleFonts.nunito(
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    // Texto normal
    displaySmall: GoogleFonts.nunito(
      fontSize: 26,
      fontWeight: FontWeight.w600,
    ),
    // Botones
    labelLarge: GoogleFonts.nunito(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 32,
    ),
  ),
);
