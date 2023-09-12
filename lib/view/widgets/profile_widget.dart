import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kid_education/view/screens/edit_profile_screen.dart';

import '../../shared/components/components.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customText(title: 'Profile',fontSize: 36,fontWeight: FontWeight.w700,),
            SizedBox(height: 109.h,),
            Image.asset('assets/images/profilePic.png',height: 194,width: 194,),
            SizedBox(height: 26.h,),
            customText(title: 'Ali',textColor: const Color(0xFF007BFF),fontWeight: FontWeight.w700,fontSize: 36,),
            SizedBox(height: 64.h,),
            playButton(function: (){
              navigateTo(context,  EditProfileScreen(),);
            }, text: 'Edit',),
            SizedBox(height: 185.h,),
          ],
        ),
      ),
    );
  }
}
