import 'package:flutter/material.dart';
import 'package:kid_education/core/color.dart';

class MainText extends StatelessWidget {
  final Color? color;
  final double? size;
  final int? weight;
  final String s;
  final bool lineThrough;
  final bool underLine;
  final String? quickColor;
  final TextAlign? textAlign;
  final TextStyle? style;
  final int? maxLines;

  final TextDirection? textDirection;

  const MainText(
    this.s, {
    super.key,
    this.color,
    this.size = 32,
    this.weight = 700,
    this.lineThrough = false,
    this.underLine = false,
    this.quickColor,
    this.textAlign,
    this.style,
    this.maxLines,
    this.textDirection,
  });

  const MainText.title(
    this.s, {
    super.key,
    this.color = black,
    this.size = 32,
    this.weight = 700,
    this.lineThrough = false,
    this.underLine = false,
    this.quickColor,
    this.textAlign,
    this.style,
    this.maxLines,
    this.textDirection,
  });

  static const _weights = {
    100: FontWeight.w100,
    200: FontWeight.w200,
    300: FontWeight.w300,
    400: FontWeight.w400,
    500: FontWeight.w500,
    600: FontWeight.w600,
    700: FontWeight.w700,
    800: FontWeight.w800,
    900: FontWeight.w900,
  };

  Color? get _color {
    if (color != null) return color;
    if (quickColor != null) {
      return Color(
          int.parse(quickColor!.substring(1, 7), radix: 16) + 0xFF000000);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (_weights[weight] == null) {
      throw Exception('Un Supported Weight $weight');
    }

    return Text(
      s,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textDirection: textDirection,
      style: style ??
          TextStyle(
            fontSize: size,
            color: _color,
            fontWeight: _weights[weight],
            decoration: lineThrough
                ? TextDecoration.lineThrough
                : underLine
                    ? TextDecoration.underline
                    : TextDecoration.none,
          ),
    );
  }
}
