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
          child: Image.asset(image,),
        ),
        SizedBox(height: 16.0.h,),
        customText(title: title,textColor: primaryColor,fontSize: 32.0.sp),
      ],
    );
  }
}
