import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kid_education/shared/components/components.dart';
import 'package:kid_education/shared/constants.dart';

import '../screens/layout_screen.dart';

class EditProfileWidget extends StatelessWidget {
   EditProfileWidget({super.key});
  final TextEditingController nameController = TextEditingController();
  final  formKey = GlobalKey<FormState>();
  @override

  Widget build(BuildContext context) {
    return primaryScaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(26.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  customText(
                    title: 'Profile',
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: 109.h,
                  ),
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      CircleAvatar(
                        radius: 97.0,
                        // backgroundColor: Colors.white,
                        child: Image.asset('assets/images/profilePic.png',height: 194,width: 194,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child:  InkWell(
                          child: const CircleAvatar(
                            radius: 22,
                            backgroundColor: defaultColor,
                            child: Image(image: AssetImage('assets/images/cameraIcon.png',),width: 24,height: 24,),),
                          onTap: () {
                          },
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                  customText(
                    title: 'Kid name',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  defaultFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter kid name!';
                      }
                      return null;
                    },
                    label: 'Kid name',
                    lines: 1,
                  ),

                  SizedBox(
                    height: 69.h,
                  ),
                  playButton(
                    function: () {
                      if(formKey.currentState!.validate()){
                        navigateTo(
                          context,
                          const LayoutScreen(),
                        );
                      }
                    },
                    text: 'Confirm',
                  ),
                  SizedBox(
                    height: 93.h,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
