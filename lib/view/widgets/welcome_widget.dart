import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../../shared/constants.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            customText(
              title: 'Welcome',
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
            InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Image.asset(
                      'assets/images/welcome_parent.png',
                      height: 200,
                      width: 200,
                    ),
                  ),
                  customText(
                    title: 'Parent',
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    textColor: primaryColor,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Image.asset(
                      'assets/images/welcome_kid.png',
                      height: 200,
                      width: 200,
                    ),
                  ),
                  customText(
                    title: 'Kid',
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    textColor: primaryColor,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {},
              child:  Row(
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
      ),
    );
  }
}
