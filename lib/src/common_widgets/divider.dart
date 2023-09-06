import 'package:flutter/material.dart';
import 'package:seenear/src/constants/colors.dart';

class CustomDivider extends StatelessWidget {
  final double height;
  final Color color;
  final EdgeInsets margin;

  const CustomDivider({
    this.height = 1,
    this.color = ColorSystem.lightOrange,
    this.margin = const EdgeInsets.symmetric(horizontal: 16),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: double.infinity,
      color: color,
    );
  }
}
