import 'package:flutter/material.dart';

class AppColors {
  static Color appBlack = HexColor.toHexColor("#1E1E1E");
  static Color appNavBarBlack = HexColor.toHexColor('#1C1C1C');
  static Color appGreen = HexColor.toHexColor('#2B3C2C');
  static Color appWhite = Colors.white;
  static Color appBackgroundColor = Colors.white;
  static Color appSecondaryTextMediumGray = HexColor.toHexColor('#666666');
  static Color applightGrey = HexColor.toHexColor('#F5F5F5');
  static Color appPrimaryTextDarkGray = HexColor.toHexColor('#333333');
// static Color appSecondaryTextMediumGray = HexColor.toHexColor('#666666');
  static Color appPlaceholderTextLightGray = HexColor.toHexColor('#B0BEC5');
  static Color appLinkBlue = HexColor.toHexColor('#005B96');
  static Color appSuccessButtonGreen = HexColor.toHexColor('#009688');
  static Color appDangerButtonRed = HexColor.toHexColor('#E53935');
  static Color appMainBackgroundOffWhite = HexColor.toHexColor('#FAFAFA');
  static Color appSecondaryBackgroundLightGray = HexColor.toHexColor('#F5F5F5');
  static Color appErrorBackgroundLightRed = HexColor.toHexColor('#FDECEA');
  static Color appDividerLineLightGray = HexColor.toHexColor('#E0E0E0');
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
