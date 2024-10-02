import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koyar/presentation/manager/colorManager.dart';

TextStyle getNormalZodiak(
    {required Color textColor,
    FontWeight fontweight = FontWeight.w400,
    double fontsize = 14}) {
  return TextStyle(
      fontFamily: 'Zodiak',
      fontSize: fontsize,
      fontStyle: FontStyle.normal,
      fontWeight: fontweight,
      color: textColor);
}

TextStyle getBlackZodiak(
    {FontWeight fontweight = FontWeight.w700, double fontsize = 14}) {
  return TextStyle(
    overflow: TextOverflow.clip ,
    color: AppColors.appBlack,
    fontFamily: 'Zodiak',
    fontSize: fontsize,
    fontStyle: FontStyle.normal,
    fontWeight: fontweight,
  );
}

TextStyle getPlusJakartaSans(
    {required Color? textColor,
    FontWeight fontweight = FontWeight.w400,
    double fontsize = 14}) {
  return GoogleFonts.plusJakartaSans(
    color: textColor,
    fontSize: fontsize,
    fontWeight: fontweight,
  );
}
