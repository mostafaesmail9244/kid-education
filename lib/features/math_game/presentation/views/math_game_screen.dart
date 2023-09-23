import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kid_education/core/helper/handle_size.dart';
import 'package:kid_education/core/widgets/game_done.dart';
import 'package:kid_education/core/widgets/game_fail.dart';
import 'package:kid_education/features/math_game/presentation/views/widgets/make_operation.dart';
import 'package:kid_education/view/screens/letters_games_screen.dart';

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

  bool? input1;
  bool? input2;
  bool? input3;

  List<TextEditingController> listText = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  void checkIfInputCorrectOrNot() {
    if (input1 == true && input2 == true && input3 == true) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            //TODO: edit in gameDoneScreen()
            builder: (context) => const GameDoneWidget(
              //TODO: navigate to numbersView
              navigteTo: LettersGameScreen(),
            ),
          ));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const GameFailWidget(
              //TODO: navigate to numbersView
              navigatTo: LettersGameScreen(),
            ),
          ));
    }
    setState(() {});
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
          Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                  onPressed: () {
                    checkIfInputCorrectOrNot();
                  },
                  child: const Text(
                    'Subbmit',
                    style: TextStyle(color: Colors.white),
                  ))),
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
                    MakeOperation(
                        text1: 2,
                        text2: '+',
                        text3: 8,
                        text4: '=',
                        onsaved: (val) {
                          if (2 + 8 == int.parse(listText[0].text)) {
                            print(listText[0].text.toString());
                            input1 = true;
                            setState(() {});
                          } else {
                            input1 = false;
                            setState(() {});
                          }
                        },
                        controller: listText[0]),
                    MakeOperation(
                        text1: 10,
                        text2: '+',
                        text3: 11,
                        text4: '=',
                        onsaved: (val) {
                          if (10 + 11 == int.parse(listText[1].text)) {
                            input2 = true;
                            setState(() {});
                          } else {
                            input2 = false;
                            setState(() {});
                          }
                        },
                        controller: listText[1]),
                    MakeOperation(
                        text1: 20,
                        text2: '-',
                        text3: 8,
                        text4: '=',
                        onsaved: (val) {
                          if (20 - 8 == int.parse(listText[2].text)) {
                            input3 = true;
                            setState(() {});
                          } else {
                            input3 = false;
                            setState(() {});
                          }
                        },
                        controller: listText[2]),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

  // Row createMethod(
  //     {required int text1,
  //     required String text2,
  //     required int text3,
  //     required String text4,
  //     required Function(String?) onsaved,
  //     required TextEditingController controller}) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           text1.toString(),
//           style: Styles.style70,
//         ),
//         Text(
//           text2,
//           style: Styles.style70,
//         ),
//         Text(
//           text3.toString(),
//           style: Styles.style70,
//         ),
//         Text(
//           text4,
//           style: Styles.style70,
//         ),
//         Container(
//           margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
//           height: 70,
//           width: 70,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: Colors.white,
//               border: Border.all(
//                 color: const Color(0xffFFE600),
//                 width: 5,
//               )),
//           child: TextField(
//             decoration: const InputDecoration(
//               border: OutlineInputBorder(borderSide: BorderSide.none),
//             ),
//             keyboardType: TextInputType.number,
//             onChanged: onsaved,
//             controller: controller,
//           ),
//         )
//       ],
//     );
//   }
