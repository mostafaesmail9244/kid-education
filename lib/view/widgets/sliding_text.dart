import 'package:flutter/material.dart';
import '../../shared/components/components.dart';

class SlidingText extends StatelessWidget {

  const SlidingText({
    super.key,
    required this.slidingAnimation, required this.text, required this.textColor,
  });

  final Animation<Offset> slidingAnimation;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child:  customText(title: text,textColor: textColor,fontSize: 50,)
          );
        });
  }
}
