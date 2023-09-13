import 'package:flutter/material.dart';

extension HandleSize on BuildContext {
  double get deviceWidth => MediaQuery.of(this).size.width;
  double get deviceHeight => MediaQuery.of(this).size.height;

  SizedBox get appbarHeight => SizedBox(
        height: MediaQuery.of(this).viewPadding.top,
      );
}
