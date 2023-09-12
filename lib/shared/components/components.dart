import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kid_education/shared/constants.dart';

Widget defaultButton({
  double width = 380,
  double height = 48,
  Color background = defaultColor,
  bool isUpperCase = true,
  double radius = 8,
  fontSize = 15,
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
        style:  TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight:fontWeight,
        ),
      ),
    ),
  );
}

Widget playButton({
  bool isUpperCase = true,
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
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 53,),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style:  GoogleFonts.almarai(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
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
      style: GoogleFonts.almarai(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    ),
  );
}
PreferredSizeWidget? appBar = AppBar();
Widget primaryScaffold({backgroundColor = Colors.transparent,body, appBar,bottomNavigationBar}) =>
    Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomCenter,
          colors: [
            scaffoldMixedColor,
            Color(0xFFFFFFFF),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: scaffoldMixedColor,
          elevation: 0.0,
          leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios_sharp,color: Colors.black,),),
        ),
        body: body,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
