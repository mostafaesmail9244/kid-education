import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kid_education/core/helper/get_asset.dart';
import 'package:kid_education/view/screens/letters_games_screen.dart';
import 'package:kid_education/view/widgets/primary_scaffold_widget.dart';
import 'package:kid_education/view/widgets/sliding_text.dart';

import '../../core/constant/constants.dart';

class GameDoneScreen extends StatefulWidget {
  const GameDoneScreen({super.key});

  @override
  State<GameDoneScreen> createState() => _GameDoneScreenState();
}

class _GameDoneScreenState extends State<GameDoneScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animatedController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();

    super.initState();

    initSlidingAnimation();

    navigateToLettersGameScreen();
  }

  @override
  void dispose() {
    super.dispose();
    animatedController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      body: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Image.asset(
                getPngAsset('gameDone'),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 150.0),
                child: SlidingText(
                  slidingAnimation: slidingAnimation,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animatedController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 15),
      end: Offset.zero,
    ).animate(animatedController);

    animatedController.forward();
  }

  void navigateToLettersGameScreen() {
    Future.delayed(
        const Duration(
          seconds: 5,
        ), () {
      Get.to(
        () => const LettersGameScreen(),
        transition: Transition.fade,
        duration: kTransitionDuration,
      );
    },
    );
  }
}
