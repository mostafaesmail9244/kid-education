import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kid_education/core/constant/color.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
    this.isUpperCase = false,
    required this.function,
    required this.text,
  });
  final bool isUpperCase;
  final Function() function;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
      height: 48,
      decoration: BoxDecoration(
        color: defaultColor,
        border: Border.all(color: defaultColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: MaterialButton(
        onPressed: function,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: GoogleFonts.almarai(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
