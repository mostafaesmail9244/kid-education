import 'package:flutter/material.dart';
import 'package:kid_education/view/widgets/primary_scaffold_widget.dart';

import '../../shared/components/components.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
        appBar: defaultAppBar(context: context,isLeading: true,),
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
