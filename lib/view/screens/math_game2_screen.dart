import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kid_education/core/utils/styles.dart';

class MathGame2Screen extends StatefulWidget {
  const MathGame2Screen({super.key});

  @override
  State<MathGame2Screen> createState() => _MathGame2ScreenState();
}

class _MathGame2ScreenState extends State<MathGame2Screen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  TextEditingController fieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/trees1.png',
            width: double.infinity,
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                createMethod(text1: '2', text2: '+', text3: '8', text4: '='),
                createMethod(text1: '2', text2: '+', text3: '8', text4: '='),
                createMethod(text1: '2', text2: '+', text3: '8', text4: '='),
                createMethod(text1: '2', text2: '+', text3: '8', text4: '='),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row createMethod({
    required String text1,
    required String text2,
    required String text3,
    required String text4,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: Styles.style70.copyWith(color: Colors.white),
        ),
        Text(
          text2,
          style: Styles.style70.copyWith(color: Colors.white),
        ),
        Text(
          text3,
          style: Styles.style70.copyWith(color: Colors.white),
        ),
        Text(
          text4,
          style: Styles.style70.copyWith(color: Colors.white),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0),
              border: Border.all(
                color: Colors.white,
                width: 3,
              )),
          child: TextFormField(
            controller: fieldController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none)),
            keyboardType: TextInputType.number,
            onTap: () {},
          ),
        )
      ],
    );
  }
}
