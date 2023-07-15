import 'package:flutter/material.dart';

class AppColor {
  static const Color primary = Color(0xFFCB8882);
  static const Color secondary = Color(0xFFFEEFEE);

  static MaterialColor primarySwatch = MaterialColor(
    primary.value,
    const <int, Color>{
      50: Color(0xFFFEEFEE),
      100: Color(0xFFFDE3E1),
      200: Color(0xFFFBD0CB),
      300: Color(0xFFF8BEB4),
      400: Color(0xFFF4AFA1),
      500: primary,
      600: Color(0xFFC37D77),
      700: Color(0xFFB9726D),
      800: Color(0xFFB06763),
      900: Color(0xFFA25B58),
    },
  );
}
