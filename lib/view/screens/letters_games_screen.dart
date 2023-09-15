import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kid_education/shared/components/components.dart';
import 'package:kid_education/view/widgets/play_button_widget.dart';
import 'package:kid_education/view/widgets/primary_scaffold_widget.dart';

import '../widgets/categorie_widget.dart';
import 'first_letter_game_screen.dart';

class LettersGameScreen extends StatelessWidget {
  const LettersGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      appBar: defaultAppBar(context: context,i: true),
      body: Column(
        children: [
          const SizedBox(
            height: 8.0,
          ),
          customText(title: 'Letters Games'),
          SizedBox(
            height: 24.0.h,
          ),
          const CategoriesWidget(
            title: 'Letters',
            image: 'assets/images/letters.png',
          ),
          SizedBox(
            height: 24.0.h,
          ),
          PlayButton(
            function: () {
              navigateTo(context, const FirstLettersGameScreen());
            },
            text: 'Play',
          ),
        ],
      ),
    );
  }
}
