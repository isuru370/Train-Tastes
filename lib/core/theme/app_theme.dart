import 'package:material_ui/material_ui.dart';

class AppColors {
  AppColors._();

  /// Navy from the Train Tastes logo.
  static const primary = Color(0xFF1B2A4A);
  static const accent = Color(0xFFE8833A);
}

class AppTheme {
  AppTheme._();

  static ThemeData get light => _build(Brightness.light);
  static ThemeData get dark => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: brightness,
      primary: brightness == Brightness.light ? AppColors.primary : null,
      secondary: AppColors.accent,
    );

    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: scheme.outlineVariant),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      fontFamily: 'Poppins',
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerHighest.withValues(alpha: 0.4),
        border: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder.copyWith(
          borderSide: BorderSide(color: scheme.primary, width: 1.5),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    );
  }
}
