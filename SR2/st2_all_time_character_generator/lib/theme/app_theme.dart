import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Central theme definition for the SR2 Character Generator.
/// Follows Material Design 3 with custom Shadowrun-appropriate styling.
/// As defined in 4-UXUI-Design.md §2.
abstract class AppTheme {
  // ============================================================
  // Standard Themes
  // ============================================================

  static final lightTheme = ThemeData(
    useMaterial3: true,
    textTheme: baseTextTheme,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.grey[50],
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    textTheme: baseTextTheme,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: Colors.grey[900],
    cardColor: Colors.grey[850],
  );

  // ============================================================
  // High Contrast Themes (Accessibility)
  // ============================================================

  static ThemeData get highContrastLightTheme {
    return lightTheme.copyWith(
      colorScheme: lightTheme.colorScheme.copyWith(
        onSurface: Colors.black,
        surface: Colors.white,
      ),
    );
  }

  static ThemeData get highContrastDarkTheme {
    return darkTheme.copyWith(
      colorScheme: darkTheme.colorScheme.copyWith(
        onSurface: Colors.white,
        surface: Colors.black,
      ),
    );
  }

  // ============================================================
  // Semantic Colors (Rule-specific)
  // ============================================================

  static const Color success = Colors.green;
  static const Color warning = Colors.orange;
  static const Color error = Colors.red;
  static const Color info = Colors.blue;
  static const Color magic = Colors.purple;
  static const Color matrix = Colors.cyan;
  static const Color physical = Colors.brown;

  // ============================================================
  // Typography
  // ============================================================

  static final TextTheme baseTextTheme = TextTheme(
    // Display Styles - für Hero-Texte
    displayLarge: GoogleFonts.poppins(
      fontSize: 57,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.25,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 45,
      fontWeight: FontWeight.w400,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 36,
      fontWeight: FontWeight.w400,
    ),

    // Headline Styles - für Überschriften
    headlineLarge: GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 28,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),

    // Title Styles - für Komponenten-Titel
    titleLarge: GoogleFonts.lato(
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: GoogleFonts.lato(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: GoogleFonts.lato(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),

    // Body Styles - für Fließtext
    bodyLarge: GoogleFonts.lato(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: GoogleFonts.lato(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: GoogleFonts.lato(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),

    // Label Styles - für Beschriftungen
    labelLarge: GoogleFonts.lato(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: GoogleFonts.lato(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: GoogleFonts.lato(
      fontSize: 11,
      fontWeight: FontWeight.w500,
    ),
  );
}