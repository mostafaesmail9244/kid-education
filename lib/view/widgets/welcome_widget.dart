import 'package:flutter/material.dart';
import 'package:kid_education/view/screens/layout_screen.dart';
import '../../shared/components/components.dart';
import '../../core/color.dart';
import '../screens/hello_kid_screen.dart';
import '../screens/parent_registration_screen.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          customText(
            title: 'Welcome',
            fontSize: 35,
            fontWeight: FontWeight.w700,
          ),

          //Select Parent (photo and text)
          selectParentOrKid(context,
              widget: const ParentRegistrationScreen(),
              title: 'Parent',
              image: 'assets/images/welcome_parent.png'),

          //Select Kid (photo and text)
          selectParentOrKid(context,
              widget: const HelloKidScreen(),
              title: 'Kid',
              image: 'assets/images/welcome_kid.png'),

          const SizedBox(
            height: 8,
          ),

          //Skip Button
          InkWell(
            onTap: () {
              navigateTo(
                context,
                const LayoutScreen(),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                customText(
                  title: 'Skip',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  textColor: const Color(0xFF8B8B8B),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xFF8B8B8B),
                  size: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InkWell selectParentOrKid(BuildContext context, {widget, image, title}) {
    return InkWell(
      onTap: () {
        navigateTo(
          context,
          widget,
        );
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Image.asset(
              image,
              height: 200,
              width: 200,
            ),
          ),
          customText(
            title: title,
            fontSize: 25,
            fontWeight: FontWeight.w700,
            textColor: primaryColor,
          ),
        ],
      ),
    );
  }
}
