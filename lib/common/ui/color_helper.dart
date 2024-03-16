import 'package:flutter/material.dart' show Color, HSLColor;

Color generateLighterColor(Color baseColor, [double? factor = 0.5]) {
  // Convert the base color to HSL
  final hslColor = HSLColor.fromColor(baseColor);

  // Increase the lightness by the factor
  final newLightness = (hslColor.lightness + factor!).clamp(0.0, 1.0);

  // Generate the new color
  final lighterColor = hslColor.withLightness(newLightness).toColor();

  return lighterColor;
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceFirst('#', 'FF');

    return int.parse(hexColor, radix: 16);
  }
}
