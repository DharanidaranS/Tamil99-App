import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Custom Colors extracted from Tailwind CSS configuration
  static const Color primary = Color(0xFF6B0217);
  static const Color primaryContainer = Color(0xFF8B1E2B);
  static const Color onPrimary = Colors.white;
  static const Color onPrimaryContainer = Color(0xFFFF9D9F);
  
  static const Color background = Color(0xFFFAF8FF);
  static const Color onBackground = Color(0xFF131B2E);
  
  static const Color surface = Color(0xFFFAF8FF);
  static const Color onSurface = Color(0xFF131B2E);
  
  static const Color goldPrimary = Color(0xFFD4AF37);
  static const Color goldLight = Color(0xFFFAE6B2);
  static const Color wineDark = Color(0xFF320409);
  static const Color wineDeep = Color(0xFF1A0205);
  
  static const Color surfaceContainerHigh = Color(0xFFE2E7FF);
  
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: primary,
        primaryContainer: primaryContainer,
        onPrimary: onPrimary,
        onPrimaryContainer: onPrimaryContainer,
        background: background,
        onBackground: onBackground,
        surface: surface,
        onSurface: onSurface,
      ),
      scaffoldBackgroundColor: background,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.inter(
          fontSize: 36,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.02,
        ),
        headlineLarge: GoogleFonts.inter(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.015,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        labelLarge: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.01,
        ),
      ),
    );
  }
}
