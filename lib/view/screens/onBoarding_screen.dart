import 'package:flutter/material.dart';
import 'package:kid_education/view/widgets/onBoarding_widget.dart';

import '../../shared/components/components.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {


  @override
  Widget build(BuildContext context) {
    return primaryScaffold(
      body: const OnBoardingWidget(),
    );
  }
}

