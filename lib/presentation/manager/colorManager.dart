import 'package:flutter/material.dart';

class AppColors {
  static Color appBlack = HexColor.toHexColor("#1E1E1E");
  static Color appGreen = HexColor.toHexColor('#2B3C2C');
  static Color appTextGrey = HexColor.toHexColor('#666666');
  static Color applightGrey = HexColor.toHexColor('#F5F5F5');

  static Color appWhite = Colors.white;
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
