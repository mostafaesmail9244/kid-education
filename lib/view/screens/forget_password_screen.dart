import 'package:flutter/material.dart';
import 'package:kid_education/core/constant/padding.core.dart';
import 'package:kid_education/core/constant/space.core.dart';
import 'package:kid_education/core/helper/get_asset.dart';
import 'package:kid_education/core/helper/handle_size.dart';
import 'package:kid_education/shared/components/components.dart';
import 'package:kid_education/view/screens/otp_screen.dart';
import 'package:kid_education/view/widgets/default_button.widget.dart';
import 'package:kid_education/view/widgets/input_field.dart';
import 'package:kid_education/view/widgets/txt.widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: edgeH24,
          child: Column(
            children: [
              context.appbarHeight,
              const Row(
                children: [
                  space36,
                  Icon(
                    Icons.arrow_back_ios_new,
                  )
                ],
              ),
              space36,
              const MainText.title('Forgot password '),
              space12,
              Image.asset(getPngAsset('password')),
              space36,
              InputTextField(
                hint: 'write your e-mail',
                title: 'Email',
              ),
              space48,
              DefaultButton(
                  isUpperCase: false,
                  width: double.infinity,
                  function: () {
                    navigateTo(context, const OtpScreen());
                  },
                  text: 'Send'),
              space56
            ],
          ),
        ),
      ),
    );
  }
}
