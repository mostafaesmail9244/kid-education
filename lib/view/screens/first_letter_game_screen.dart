import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kid_education/core/constant/color.dart';
import 'package:kid_education/core/helper/get_asset.dart';
import 'package:kid_education/shared/components/components.dart';
import 'package:kid_education/view/screens/categories_screen.dart';
import 'package:kid_education/view/screens/game_done_screen.dart';
import 'package:kid_education/view/widgets/primary_scaffold_widget.dart';

class FirstLettersGameScreen extends StatefulWidget {
  const FirstLettersGameScreen({super.key});

  @override
  State<FirstLettersGameScreen> createState() => _LettersGameScreenState();
}

class _LettersGameScreenState extends State<FirstLettersGameScreen> {
  Color colorA = targetLetterAColor;
  Color colorB = targetLetterBColor;
  Color colorC = targetLetterCColor;
  int i=0;

  @override
  Widget build(BuildContext context) {
    bool showDraggableA = ((colorA == targetLetterAColor));
    bool showDraggableB = ((colorB == targetLetterBColor));
    bool showDraggableC = ((colorC == targetLetterCColor));
    return PrimaryScaffold(
      body: RotatedBox(
        quarterTurns: 1,
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            ///// Background Image//////////
            Image.asset(
              getPngAsset('lettersTree'),
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.height,
              height: MediaQuery.of(context).size.width,
            ),
            ///// Leading Arrow Icon //////////
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 30,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  height: 32,
                  width: 32,
                  getPngAsset('arrowleft2'),
                ),
              ),
            ),

            DraggableLetters(showDraggableB: showDraggableB, showDraggableC: showDraggableC, showDraggableA: showDraggableA,),

            targetLetters(),

          ],
        ),
      ),
    );
  }

  Widget targetLetters() {
    return Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 240.0,
                ),
                child: DragTarget<Color>(
                  onAccept: (data) {
                    setState(() {
                      colorA = data;
                      i++;
                      if(i==3&&colorA==letterAColor){
                        navigateTo(context, const GameDoneScreen(),);
                      }
                    });
                  },
                  builder: (context, candidateData, rejectedData) =>
                      TargetLetterItem(
                    targetLetter: 'A',
                    targetColor: colorA,
                  ),
                ),
              ),
              //Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 275.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50.0),
                      child: DragTarget<Color>(
                        onAccept: (data) {
                          setState(() {
                            colorC = data;
                            i++;
                            if(i==3&&colorC==letterCColor){
                              navigateTo(context, const GameDoneScreen(),);
                            }
                          });
                        },
                        builder: (context, candidateData, rejectedData) =>
                            TargetLetterItem(
                          targetLetter: 'C',
                          targetColor: colorC,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 150,
                    ),
                    DragTarget<Color>(
                      onAccept: (data) {
                        setState(() {
                          colorB = data;
                          i++;
                          if(i==3&&colorB==letterBColor){
                            navigateTo(context, const GameDoneScreen(),);
                          }
                        });
                      },

                      builder: (context, candidateData, rejectedData) =>
                          TargetLetterItem(
                        targetLetter: 'B',
                        targetColor: colorB,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }

}

class DraggableLetters extends StatelessWidget {
  const DraggableLetters({
    super.key,
    required this.showDraggableB,
    required this.showDraggableC,
    required this.showDraggableA,
  });

  final bool showDraggableB;
  final bool showDraggableC;
  final bool showDraggableA;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 140,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 80.0,
              ),
              child: DraggableItem(
                  showDraggable: showDraggableB,
                  letterColor: letterBColor,
                  letter: 'B'),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 65.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DraggableItem(
                      showDraggable: showDraggableC,
                      letterColor: letterCColor,
                      letter: 'C'),
                  const SizedBox(
                    width: 117,
                  ),
                  DraggableItem(
                      showDraggable: showDraggableA,
                      letterColor: letterAColor,
                      letter: 'A'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}


class DraggableItem extends StatelessWidget {
  const DraggableItem({
    super.key,
    required this.showDraggable,
    required this.letterColor,
    required this.letter,
  });

  final bool showDraggable;
  final Color letterColor;
  final String letter;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !showDraggable,
      child: Opacity(
        opacity: showDraggable ? 1 : 0,
        child: Draggable<Color>(
          data: letterColor,
          feedback: RotatedBox(
            quarterTurns: 1,
            child: Text(
              letter,
              style: GoogleFonts.grandstander(
                color: letterColor,
                fontSize: 109.25,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          child: Text(
            letter,
            style: GoogleFonts.grandstander(
              color: letterColor,
              fontSize: 109.25,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class TargetLetterItem extends StatelessWidget {
  final String targetLetter;
  final Color targetColor;

  const TargetLetterItem({
    super.key,
    required this.targetLetter,
    required this.targetColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Center(
        child: Text(
          targetLetter,
          style: GoogleFonts.grandstander(
            color: targetColor,
            fontSize: 109.25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

