import 'package:flutter/material.dart';
import 'package:kid_education/shared/constants.dart';

Widget defaultButton({
  double width = 380,
  double height = 48,
  Color background = defaultColor,
  bool isUpperCase = true,
  double radius = 8,
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
        style:  TextStyle(
          color: textColor,
          fontSize: 15,
          fontWeight: FontWeight.w600,
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
  required IconData prefixIconData,
  IconData? suffixIconData,
  VoidCallback? suffixPressed,
  bool? isClickable = true,
  int? lines,
}) {
  return TextFormField(
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
        prefixIcon: Icon(prefixIconData),
        suffixIcon: suffixIconData != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffixIconData))
            : null,
        border: const OutlineInputBorder()),
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
      style: TextStyle(
        fontFamily: 'Grandstander',
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      )
    ),
  );
}

Widget primaryScaffold({backgroundColor = Colors.transparent,body,appBar,bottomNavigationBar}) =>
    Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomCenter,
          colors: [
            Color(0xFFFFE3F4),
            Color(0xFFFFFFFF),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: appBar,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
