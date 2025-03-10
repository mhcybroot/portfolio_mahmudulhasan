import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Color scheme
  static const Color primaryColor = Color(0xFF6200EE);
  static const Color primaryVariantColor = Color(0xFF3700B3);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color secondaryVariantColor = Color(0xFF018786);
  static const Color backgroundColor = Color(0xFFF8F9FA);
  static const Color cardColor = Colors.white;
  static const Color textPrimaryColor = Color(0xFF212121);
  static const Color textSecondaryColor = Color(0xFF757575);
  static const Color dividerColor = Color(0xFFEEEEEE);
  static const Color errorColor = Color(0xFFB00020);

  // Text styles
  static TextStyle headlineLarge = GoogleFonts.montserrat(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: textPrimaryColor,
  );

  static TextStyle headlineMedium = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textPrimaryColor,
  );

  static TextStyle headlineSmall = GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: textPrimaryColor,
  );

  static TextStyle titleLarge = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: textPrimaryColor,
  );

  static TextStyle titleMedium = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: textPrimaryColor,
  );

  static TextStyle bodyLarge = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: textPrimaryColor,
  );

  static TextStyle bodyMedium = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: textSecondaryColor,
  );

  static TextStyle bodySmall = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: textSecondaryColor,
  );

  // Button styles
  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    textStyle: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  static ButtonStyle outlinedButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: primaryColor,
    side: const BorderSide(color: primaryColor),
    textStyle: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  // Card styles
  static BoxDecoration cardDecoration = BoxDecoration(
    color: cardColor,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  );

  // Dark theme
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: const Color(0xFF121212),
    cardColor: const Color(0xFF1E1E1E),
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      error: errorColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF1E1E1E),
      titleTextStyle: GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );

  // Light theme
  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    cardColor: cardColor,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      error: errorColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: textPrimaryColor,
      ),
    ),
  );
} 