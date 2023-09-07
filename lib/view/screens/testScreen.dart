import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return primaryScaffold(
      body: Center(
        child:  Column(
          children: [
            Image.asset('assets/images/games.png'),
          ],
        ),
      )
    );
  }
}
