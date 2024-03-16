import 'package:flutter/material.dart';

class AppCustomTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColorPallete.seedColor,
      primary: AppColorPallete.seedColor,
    ),
    useMaterial3: true,

    // appbar theme
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    ),

    // input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(0.3),
          width: 0.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColorPallete.seedColor,
          width: 0.5,
        ),
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: AppColorPallete.seedColor,
      primary: AppColorPallete.seedColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(0.3),
          width: 0.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColorPallete.seedColor,
          width: 0.5,
        ),
      ),
    ),
  );
}

class AppColorPallete {
  static const Color seedColor = Color(0xFF534741);
}
