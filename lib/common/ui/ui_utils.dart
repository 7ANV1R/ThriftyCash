import 'package:flutter/material.dart'
    show Brightness, BuildContext, ColorScheme, MediaQuery, Size, TextTheme, Theme, ThemeData;

Size getSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

ThemeData getThemeData(BuildContext context) {
  return Theme.of(context);
}

ColorScheme getColorScheme(BuildContext context) {
  return Theme.of(context).colorScheme;
}

TextTheme getTextTheme(BuildContext context) {
  return Theme.of(context).textTheme;
}

bool isDarkModeOn(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}
