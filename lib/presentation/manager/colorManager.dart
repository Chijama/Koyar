import 'package:flutter/material.dart';

class AppColors {
  static Color appBlack = HexColor.toHexColor("#1E1E1E");
}

extension HexColor on Color {
  static Color toHexColor(String hexcolorcode) {
    hexcolorcode = hexcolorcode.replaceAll('#', '');
    if (hexcolorcode.length == 6) {
      hexcolorcode = 'FF$hexcolorcode';
    }
    return Color(
      int.parse(hexcolorcode, radix: 16),
    );
  }
}
