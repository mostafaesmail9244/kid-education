import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/components/components.dart';
import '../../shared/constants.dart';
import '../../shared/network/local/cache_helper.dart';
import '../screens/login_screen.dart';

class OnBoardingWidget extends StatefulWidget {
   const OnBoardingWidget({super.key});

  @override
  State<OnBoardingWidget> createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  List<BoardingModel> board = [
    BoardingModel(
      image: 'assets/images/onBoarding1.png',
      title: 'You can learn anything.',
      body: 'Build a deep, solid understanding in math, science, and more.',
    ),
    BoardingModel(
      image: 'assets/images/onBoarding2.png',
      title: 'Every child deserves the chance to learn.',
      body:
      'Build a deeAcross the globe, 617 million children are missing basic math and reading skills. We’re a nonprofit delivering the education they need, and we need your help. You can change the course of a child’s life.p, solid understanding in math, science, and more.',
    ),
    BoardingModel(
      image: 'assets/images/onBoarding3.png',
      title: 'Differentiate your classroom and engage every student.',
      body:
      'We empower teachers to support their entire classroom. 90% of US teachers who have used Khan Academy have found us effective.',
    ),
  ];

  var boardController = PageController();

  bool isLast = false;

  void submit() {
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value) {
      if (value) {
        navigateAndFinish(
          context,
          const LoginScreen(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          //Board
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) => buildBoardItem(board[index]),
              physics: const BouncingScrollPhysics(),
              itemCount: board.length,
              onPageChanged: (index) {
                if (index == (board.length) - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              controller: boardController,
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: board.length,
                  effect:  const JumpingDotEffect(
                    dotColor: Colors.grey,
                    activeDotColor: defaultColor,
                    dotHeight: 9.0,
                    spacing: 5.0,
                    dotWidth: 9.0,
                    paintStyle: PaintingStyle.fill,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          defaultButton(
            function: () {
              if (isLast == true) {
                submit();
              } else {
                boardController.nextPage(
                  duration: const Duration(milliseconds: 750),
                  curve: Curves.fastOutSlowIn,
                );
              }
            },
            text: 'next',
            isUpperCase: true,
          ),
          const SizedBox(
            height: 10,
          ),
          defaultButton(
            function: () {
              submit();
            },
            text: 'skip',
            isUpperCase: true,
            textColor: defaultColor,
            background: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget buildBoardItem(BoardingModel model) => SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 300.0,
              width: 300.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  32.0,
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image(
                image: AssetImage(
                  model.image,
                ),
                fit: BoxFit.cover,
                height: 300.0,
                width: 300.0,
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          customText(
            title: model.title,
            fontSize: 23,
          ),
          const SizedBox(
            height: 15.0,
          ),
          customText(
            title: model.body,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(
            height: 15.0,
          ),
        ],
      ),
    ),
  );
}
class BoardingModel {
  final String title;
  final String body;
  final String image;

  BoardingModel({
    required this.title,
    required this.body,
    required this.image,
  });
}
