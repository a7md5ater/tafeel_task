import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  /// PRIMARY COLORS
  static const Color primary = Color(0xff045785);
  static const Color primaryLight = Color(0xffB1CBD9);
  static const Color darkGreen = Color(0xff075E54);
  static const Color green = Color(0xff16B364);
  static const Color grey = Color(0xffDCDCDC);
  static const Color lightGrey = Color(0xffF7F7F7);
  static const Color orange = Color(0xffEA580C);

  /// TEXT COLORS
  static const Color primaryText = Color(0xff111827);
  static const Color greyText = Color(0xff4B5563);
  static const Color lightGreyText = Color(0xffB6B6B6);
  static const Color disabledText = Color(0xffE6EEF3);

  /// CONST COLORS
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color red = Colors.red;

  static MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.toARGB32(), {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    });
  }

  static int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  static Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1,
  );

  static int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  static Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1,
  );
}
