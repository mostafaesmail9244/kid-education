import 'package:flutter/material.dart';
import 'package:kid_education/core/color.dart';
import 'package:kid_education/core/constant/padding.core.dart';
import 'package:pinput/pinput.dart';

class OtpWidget extends StatelessWidget {
  OtpWidget({
    super.key,
    this.count = 6,
  });
  final int count;

  /// this controller will be use to get pin code from design and send it to [verify] method
  final pinController = TextEditingController();

  /// getting default pinput theme
  PinTheme get defaultPinTheme => PinTheme(
        margin: edge4,
        width: 48,
        height: 48,
        textStyle: const TextStyle(
          fontSize: 24,
          color: Color(0xff23262F),
          fontWeight: FontWeight.w600,
        ),
        decoration: BoxDecoration(
          color: white,
          border: Border.all(color: greyStork),
          borderRadius: BorderRadius.circular(8),
        ),
      );

  /// it just a copy of all [defaultPinTheme] but with changing color of border
  PinTheme get focusedPinTheme => defaultPinTheme.copyDecorationWith(
        border: Border.all(color: primaryColor),
      );
  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: pinController,
      length: count,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: defaultPinTheme,
      showCursor: true,
      cursor: Container(
        width: 16,
        height: 1,
        color: primaryColor,
      ),
    );
  }
}
