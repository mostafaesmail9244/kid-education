import 'package:flutter/material.dart';
import 'package:kid_education/core/constant/color.dart';
import 'package:kid_education/core/constant/space.core.dart';
import 'package:kid_education/core/helper/get_asset.dart';
import 'package:kid_education/core/helper/handle_size.dart';
import 'package:kid_education/view/widgets/default_button.widget.dart';
import 'package:kid_education/view/widgets/otp_widget.dart';
import 'package:kid_education/view/widgets/txt.widget.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
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
              const MainText.title('Hello Kid'),
              space18,
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    width: 200,
                    height: 200,
                    child: MainText(
                      'Enter the code to access to the profile',
                      textAlign: TextAlign.center,
                      weight: 400,
                      size: 24,
                      color: grey,
                      maxLines: 3,
                    ),
                  ),
                  Image.asset(getPngAsset('kid')),
                ],
              ),
              space24,
              OtpWidget(
                count: 5,
              ),
              space32,
              DefaultButton(
                function: () {},
                text: 'Send',
                isUpperCase: false,
              ),
              space56
            ],
          ),
        ),
      ),
    );
  }
}
