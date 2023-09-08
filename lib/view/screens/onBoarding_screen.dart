import 'package:flutter/material.dart';
import 'package:kid_education/view/widgets/onBoarding_widget.dart';


class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomCenter,
          colors: [
            Color(0xFFFFE3F4),
            Color(0xFFFFFFFF),
          ],
        ),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: OnBoardingWidget(),
      ),
    );
  }
}

