import 'package:flutter/material.dart';

base class BaseColor {
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffFFFFFF);

  static const Color primary = Color(0xff729CB2);
  static const Color darkGreen = Color(0xff00723D);
  static const Color text = Color(0xff070629);
  static const Color border = Color(0xff94A3B8);
  // static const Color hint = Color(0xffB6B6B6);
  static const Color disable = Color(0xffB6B6B6);
  static const Color unSelect = Color(0xff9B9B9B);
  static const Color subtitle = Color(0xff64748B);

  static const Color success = Color(0xff047857);
  static const Color danger = Color(0xffDC3545);
  static const Color warning = Color(0xffFFC107);
  static const Color info = Color(0xff17A2B8);

  static const int _greyPrimaryValue = 0xFFCED4DA;
  static const MaterialColor grey = MaterialColor(
    _greyPrimaryValue,
    <int, Color>{
      100: Color(0xFFF8F9FA),
      200: Color(0xFFE9ECEF),
      300: Color(0xFFDEE2E6),
      400: Color(0xFFCED4DA),
      500: Color(_greyPrimaryValue),
      600: Color(0xFF6C757D),
      700: Color(0xFF495057),
      800: Color(0xFF343A40),
      900: Color(0xFF212529),
    },
  );

  static const int _greenPrimaryValue = 0xFF198754;
  static const MaterialColor green = MaterialColor(
    _greenPrimaryValue,
    <int, Color>{
      100: Color(0xFFD1E7DD),
      200: Color(0xFFA3CFBB),
      300: Color(0xFF75B798),
      400: Color(0xFF479F76),
      500: Color(_greenPrimaryValue),
      600: Color(0xFF146C43),
      700: Color(0xFF0F5132),
      800: Color(0xFF0A3622),
      900: Color(0xFF051B11),
    },
  );
}
