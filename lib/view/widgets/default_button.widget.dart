import 'package:flutter/material.dart';
import 'package:kid_education/core/color.dart';

class DefaultButton extends StatelessWidget {
  final double width;
  final double height;
  final Color background;
  final bool isUpperCase;
  final double radius;
  final double fontSize;
  final FontWeight? fontWeight;
  final Function() function;
  final String text;
  final Color? textColor;
  const DefaultButton({
    super.key,
    this.width = 380,
    this.height = 48,
    this.background = defaultColor,
    this.isUpperCase = true,
    this.radius = 8,
    this.fontSize = 15,
    this.fontWeight = FontWeight.w600,
    required this.function,
    required this.text,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: background,
        border: Border.all(color: defaultColor),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}