import 'package:flutter/material.dart';
import 'package:kid_education/core/constant/color.dart';

import '../../shared/components/components.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child:  customText(title: 'GREAT JOB',textColor: greatGobColor,fontSize: 50,)
          );
        });
  }
}
