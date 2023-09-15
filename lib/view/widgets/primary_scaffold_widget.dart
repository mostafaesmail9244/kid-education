import 'package:flutter/material.dart';
import 'package:kid_education/core/constant/color.dart';

class PrimaryScaffold extends StatelessWidget {
  const PrimaryScaffold(
      {super.key,
      this.context,
      this.backgroundColor = Colors.transparent,
      this.body,
      this.bottomNavigationBar,
      this.appBar});

  final context;

  final Color backgroundColor;
  final body;
  final appBar;
  final bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomCenter,
          colors: [
            scaffoldMixedColor,
            Color(0xFFFFFFFF),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: appBar,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
