import 'package:flutter/material.dart';
import 'package:kid_education/shared/components/components.dart';
import 'package:kid_education/view/widgets/primary_scaffold_widget.dart';
import '../widgets/welcome_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      appBar: defaultAppBar(context: context, isLeading: false,),
      body: const WelcomeWidget(),
    );
  }
}

