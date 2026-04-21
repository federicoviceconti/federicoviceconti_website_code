import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    final scheme = ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: const Color(0xFF2557D6),
      surface: const Color(0xFFF7F9FC),
    );
    return _buildThemeData(scheme);
  }

  static ThemeData dark() {
    final scheme = ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color(0xFF8FAEFF),
      surface: const Color(0xFF0B1220),
    );
    return _buildThemeData(scheme);
  }

  static ThemeData _buildThemeData(ColorScheme colorScheme) {
    const textTheme = TextTheme(
      displayLarge: TextStyle(fontSize: 56, fontWeight: FontWeight.w700, height: 1.1),
      displaySmall: TextStyle(fontSize: 40, fontWeight: FontWeight.w700, height: 1.15),
      headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, height: 1.2),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(fontSize: 16, height: 1.6),
      bodyMedium: TextStyle(fontSize: 14, height: 1.5),
      labelLarge: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.8,
        fontFamily: 'monospace',
      ),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      textTheme: textTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface.withValues(alpha: 0.86),
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
      ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
        side: BorderSide(color: colorScheme.outline),
        backgroundColor: colorScheme.surfaceContainerHighest,
        labelStyle: TextStyle(color: colorScheme.onSurface),
      ),
      cardTheme: CardThemeData(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.72),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: colorScheme.outline),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.outline.withValues(alpha: 0.65),
        thickness: 1,
        space: 1,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
