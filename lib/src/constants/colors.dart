import 'package:flutter/material.dart';

class ColorSystem {
  const ColorSystem._();

  static final FontColor font = FontColor._();
  static final PointColor point = PointColor._();

  static const Color orange = Color(0xFFFFCE51);
  static const Color lightOrange = Color(0xFFFFFBF2);
  static const Color white = Color(0xFFFFFFFF);
  static const Color darkOrange = Color(0xFFE4AA12);
  static const Color backgroundLightOrange = Color(0xFFFFFBF2);
  static const Color backgroundWhite = Color(0xFFFFFFFF);
}

class FontColor {
  FontColor._();

  final Color brown100 = const Color(0xFF4D3E1A);
  final Color brown60 = const Color(0xFFE4AA12);
  final Color brown40 = const Color(0xFFB8B2A3);
}

class PointColor {
  PointColor._();

  final Color yellow = const Color(0xFFFFE5A3);
  final Color lightYellow = const Color(0xFFFFEEC1);
}
