import 'package:flutter/material.dart';
import 'package:kid_education/core/constant/padding.core.dart';
import 'package:kid_education/core/constant/space.core.dart';
import 'package:kid_education/core/helper/handle_size.dart';
import 'package:kid_education/shared/components/components.dart';
import 'package:kid_education/view/screens/otp_verfication_screen.dart';
import 'package:kid_education/view/widgets/default_button.widget.dart';
import 'package:kid_education/view/widgets/input_field.dart';
import 'package:kid_education/view/widgets/txt.widget.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
            const MainText.title('New password '),
            space50,
            InputTextField(
              hint: 'write your password',
              title: 'Password',
            ),
            space32,
            InputTextField(
              hint: 'write your password',
              title: 'Repeat Password',
            ),
            space48,
            DefaultButton(
              function: () {
                navigateTo(context, const OtpVerificationScreen());
              },
              text: 'Send',
              isUpperCase: false,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
