import 'package:flutter/material.dart';
import 'package:rio_cupones/src/constants/colors.dart';

ThemeData getThemeData(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: secondary_color),
    useMaterial3: true,
    scaffoldBackgroundColor: lightGray,
    appBarTheme: AppBarTheme(
      color: secondary_color,
      foregroundColor: primary_color,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: secondary_color,
        ),
      ),
    ),
  );
}
