import 'package:flutter/material.dart';

class ZenFocusTheme {
  static const Color primary = Color(0xFF4A90E2);       // Calm Blue
  static const Color secondary = Color(0xFF50E3C2);     // Mint Accent
  static const Color background = Color(0xFFF5F7FA);    // Soft Gray
  static const Color surface = Color(0xFFFFFFFF);       // Pure White
  static const Color textPrimary = Color(0xFF2C3E50);   // Deep Slate
  static const Color textSecondary = Color(0xFF7F8C8D); // Muted Gray
  static const Color error = Color(0xFFE74C3C);         // Alert Red

  static ThemeData get themeData {
    return ThemeData(
      scaffoldBackgroundColor: background,
      primaryColor: primary,
      colorScheme: ColorScheme.light(
        primary: primary,
        secondary: secondary,
        surface: surface,
        error: error,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: textPrimary,
        onError: Colors.white,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: textPrimary),
        bodyMedium: TextStyle(color: textSecondary),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primary,
        foregroundColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: secondary,
        foregroundColor: Colors.white,
      ),
    );
  }
}
