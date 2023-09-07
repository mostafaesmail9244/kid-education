import 'package:flutter/material.dart';
import 'package:kid_education/shared/components/components.dart';
import '../widgets/welcome_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return primaryScaffold(
      body: const WelcomeWidget(),
    );
  }
}

