import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'fonts_manager.dart';

TextStyle getTextStyle(
    {double? fontSize, FontWeight? fontWeight, Color? color}) {
  return GoogleFonts.montserratAlternates(
      fontSize: fontSize, fontWeight: fontWeight, color: color);
}

//Light Style
TextStyle getLightStyle({double fontSize = 12, Color? color}) => getTextStyle(
    fontSize: fontSize, fontWeight: FontWeightManager.light, color: color);
//Regular Style
TextStyle getRegularStyle({double fontSize = 12, required Color color}) {
  return getTextStyle(
      fontSize: fontSize, fontWeight: FontWeightManager.regular, color: color);
}

//Medium Style
TextStyle? getMediumStyle({double fontSize = 12, Color? color}) => getTextStyle(
    fontSize: fontSize, fontWeight: FontWeightManager.medium, color: color);
//SemiBold Style
TextStyle getSemiBoldStyle({double fontSize = 12, Color? color}) =>
    getTextStyle(
        fontSize: fontSize,
        fontWeight: FontWeightManager.semiBold,
        color: color);
//Bold Style
TextStyle getBoldStyle({double fontSize = 12, Color? color}) => getTextStyle(
    fontSize: fontSize, fontWeight: FontWeightManager.bold, color: color);
