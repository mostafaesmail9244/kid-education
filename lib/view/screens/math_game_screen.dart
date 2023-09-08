import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kid_education/core/helper/handle_size.dart';
import 'package:kid_education/core/utils/styles.dart';

class MathGameView extends StatefulWidget {
  const MathGameView({super.key});

  @override
  State<MathGameView> createState() => _MathGameViewState();
}

class _MathGameViewState extends State<MathGameView> {
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
      DeviceOrientation.portraitUp
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/trees2.png',
            width: double.infinity,
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(180, 223, 26, 7).withOpacity(0.50),
              ),
              width: context.deviceWidth / 1.6,
              height: context.deviceHeight / 1.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  createMethod(text1: '2', text2: '+', text3: '8', text4: '='),
                  createMethod(text1: '2', text2: '+', text3: '8', text4: '='),
                  createMethod(text1: '2', text2: '+', text3: '8', text4: '='),
                ],
              ),
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
          style: Styles.style70,
        ),
        Text(
          text2,
          style: Styles.style70,
        ),
        Text(
          text3,
          style: Styles.style70,
        ),
        Text(
          text4,
          style: Styles.style70,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              border: Border.all(
                color: const Color(0xffFFE600),
                width: 5,
              )),
          child: TextFormField(
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
