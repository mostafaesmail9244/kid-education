import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kid_education/shared/components/components.dart';
import 'package:kid_education/shared/constants.dart';


class CategoriesWidget extends StatelessWidget {
   const CategoriesWidget({Key? key,required this.title,required this.image}) : super(key: key);
   final String title;
   final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 20.0,),
          color: Colors.white,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(164.0),
          ),
          child: Image.asset(image,fit: BoxFit.contain,height: 260,width: 260.0,),
        ),
        customText(title: title,textColor: primaryColor,fontSize: 28.0.sp),
        SizedBox(height: 24.0.h,)
      ],
    );
  }
}
