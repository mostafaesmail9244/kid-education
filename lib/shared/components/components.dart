import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kid_education/core/constant/color.dart';
import 'package:kid_education/core/helper/get_asset.dart';

Widget defaultButton({
  double width = 380,
  double height = 48,
  Color background = defaultColor,
  bool isUpperCase = true,
  double radius = 8,
  double fontSize = 15,
  fontWeight = FontWeight.w600,
  required Function() function,
  required String text,
  Color? textColor = Colors.white,
}) {
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

Widget playButton({
  bool isUpperCase = false,
  required Function() function,
  required String text,
}) {
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

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  ValueChanged<String>? onSubmitted,
  ValueChanged<String>? onChange,
  GestureTapCallback? onTap,
  bool isPassword = false,
  required FormFieldValidator<String>? validate,
  required String label,
  IconData? prefixIconData,
  IconData? suffixIconData,
  VoidCallback? suffixPressed,
  bool? isClickable = true,
  int? lines,
  double width = 380,
  double height = 58,
}) {
  return SizedBox(
    height: height,
    width: width,
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmitted,
      onChanged: onChange,
      onTap: onTap,
      maxLines: lines,
      validator: validate,
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: prefixIconData != null ? Icon(prefixIconData) : null,
          suffixIcon: suffixIconData != null
              ? IconButton(onPressed: suffixPressed, icon: Icon(suffixIconData))
              : null,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          )),
    ),
  );
}

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

Future<void> navigateAndFinish(context, widget) {
  return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false);
}

Widget customText({
  required String title,
  double fontSize = 32.0,
  FontWeight fontWeight = FontWeight.w700,
  Color textColor = Colors.black,
}) {
  return Center(
    child: Text(
      title,
      style: GoogleFonts.almarai(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    ),
  );
}

PreferredSizeWidget? defaultAppBar({
  required BuildContext context,
  String? title,
  List<Widget>? actions,
  bool isLeading = true,
  bool i = false,
  Widget? widget,
}) =>
    AppBar(
      backgroundColor: scaffoldMixedColor,
      elevation: 0.0,
      leading: isLeading
          ? IconButton(
              onPressed: () {
                i
                    ? navigateTo(context, widget)
                    : Navigator.pop(context);
              },
              icon: Image.asset(
                getPngAsset(
                  'arrowleft2',
                ),
                height: 32,
                width: 32,
              ))
          : Opacity(
        opacity: 0,
            child: IconButton(
            onPressed: () {
              i
                  ? navigateTo(context, widget)
                  : Navigator.pop(context);
            },
            icon: Image.asset(
              getPngAsset(
                'arrowleft2',
              ),
              height: 32,
              width: 32,
            )),
          ),
    );
