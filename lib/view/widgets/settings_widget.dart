import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kid_education/core/helper/get_asset.dart';
import 'package:kid_education/shared/components/components.dart';

import '../screens/settings_screen_page2.dart';
import 'default_button.widget.dart';

class SettingsWidget extends StatelessWidget {
   SettingsWidget({super.key});

  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              customText(
                title: 'Settings',
                fontSize: 36,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 29.h,
              ),
              Image.asset(
                getPngAsset('profilePic'),
                height: 194,
                width: 194,
              ),
              SizedBox(
                height: 32.h,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: customText(
                  title: 'Enter the password  to access to the setting',
                  textColor: const Color(0xFF8B8B8B),
                  fontWeight: FontWeight.w400,
                  fontSize: 28,
                ),
              ),
              SizedBox(
                height: 48.h,
              ),
              defaultFormField(
                  controller: passController,
                  keyboardType: TextInputType.text,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter the password!';
                    } else {
                      return null;
                    }
                  },
                  label: 'write your password'),
              SizedBox(
                height: 54.h,
              ),
              DefaultButton(
                function: () {
                  if(formKey.currentState!.validate()){
                    navigateTo(context, const SettingScreenPage2(),);
                  }
                },
                text: 'Send',
              ),
              SizedBox(
                height: 124.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
