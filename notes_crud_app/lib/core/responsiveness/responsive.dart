import 'package:flutter/material.dart';

double screenHeight(BuildContext context) => MediaQuery.sizeOf(context).height;
double screenWidth(BuildContext context) => MediaQuery.sizeOf(context).width;

double scaleH(BuildContext context, double scale) {
  const double baseHeight = 800;
  return (screenHeight(context) / baseHeight) * scale;
}

double scaleW(BuildContext context, double scale) {
  const double baseWidth = 360;
  return (screenWidth(context) / baseWidth) * scale;
}

TextStyle getCustomTextStyle(
  BuildContext context, {
  double? fontSize,
  Color? color,
  Color? backgroundColor,
  FontWeight? fontWeight,
  double? letterSpacing,
  TextOverflow? overflow,
}) {
  return TextStyle(
    fontSize: fontSize != null ? scaleW(context, fontSize) : fontSize,
    color: color,
    backgroundColor: backgroundColor,
    fontWeight: fontWeight,
    letterSpacing: letterSpacing,
    overflow: overflow,
  );
}
