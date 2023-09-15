import 'package:flutter/material.dart';
import 'package:kid_education/core/color.dart';
import 'package:kid_education/core/constant/padding.core.dart';
import 'package:kid_education/core/constant/space.core.dart';
import 'package:kid_education/core/helper/get_asset.dart';
import 'package:kid_education/core/helper/handle_size.dart';
import 'package:kid_education/shared/components/components.dart';
import 'package:kid_education/view/screens/new_password_screen.dart';
import 'package:kid_education/view/widgets/default_button.widget.dart';
import 'package:kid_education/view/widgets/txt.widget.dart';

import '../widgets/otp_widget.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Form(
        key: formKey,
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
              Image.asset(getPngAsset('otp')),
              space24,
              const Expanded(
                child: MainText(
                  'Enter the 6-digital code sent to your E-mail',
                  size: 24,
                  weight: 400,
                  color: grey,
                  maxLines: 3,
                ),
              ),
              space24,
              OtpWidget(),
              space32,
              DefaultButton(
                function: () {
                  navigateTo(context, const NewPasswordScreen());
                },
                text: 'Send',
                isUpperCase: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
