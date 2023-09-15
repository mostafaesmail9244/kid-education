import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kid_education/core/constant/color.dart';
import 'package:kid_education/core/helper/get_asset.dart';
import 'package:kid_education/view/widgets/primary_scaffold_widget.dart';

class TestLettersGameScreen extends StatefulWidget {
  const TestLettersGameScreen({super.key});

  @override
  State<TestLettersGameScreen> createState() => _TestLettersGameScreenState();
}

class _TestLettersGameScreenState extends State<TestLettersGameScreen> {
  Color targetColor = letterBColor;

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      body: RotatedBox(
        quarterTurns: 1,
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            Image.asset(
              getPngAsset('lettersTree'),
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.height,
              height: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 30,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  height: 32,
                  width: 32,
                  getPngAsset('arrowleft2'),
                ),
              ),
            ),
            const DraggableLetters(),


            Column(
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
                      setState(
                            () {
                              print('////////$data');

                              DraggableLetters.colorB = data;
                              print('DraggableLetters.colorB   ${DraggableLetters.colorB}');
                        },
                      );
                    },
                    builder: (context, _, __) => Container(
                      width: 100,
                      height: 100,
                      child: Center(
                        child: Text(
                          'B',
                          style: GoogleFonts.grandstander(
                            color: DraggableLetters.colorB,
                            fontSize: 109.25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Text(
                  'E',
                  style: GoogleFonts.grandstander(
                    color: DraggableLetters.colorB,
                    fontSize: 109.25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DraggableLetters extends StatelessWidget {
  static const Color colorA = letterAColor;
  static  Color colorB = letterBColor;
  static const Color colorC = letterCColor;

  const DraggableLetters({super.key});

  @override
  Widget build(BuildContext context) {
    bool showDraggableA = ((colorA == letterAColor));
    bool showDraggableB = ((colorB == letterBColor));
    bool showDraggableC = ((colorC == letterCColor));

    return Row(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 140,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 280.0,
              ),
              child: DraggableItem(
                showDraggable: showDraggableB,
                letter: 'B',
                letterColor: letterBColor,
              ),
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
                  SizedBox(
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

class TargetLetters extends StatelessWidget {
  const TargetLetters({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 240.0,
          ),
          child: TreeLetter(
            letter: 'A',
            targetColor: targetLetterAColor,
            isDraggable: false,
          ),
        ),
        //Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 275.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 50.0),
                child: TreeLetter(
                  letter: 'C',
                  targetColor: targetLetterCColor,
                  isDraggable: false,
                ),
              ),
              SizedBox(
                width: 150,
              ),
              TreeLetter(
                letter: 'B',
                targetColor: targetLetterBColor,
                isDraggable: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TreeLetter extends StatefulWidget {
  late String letter;
  Color? color;
  late bool isDraggable;
  Color? targetColor;

  TreeLetter({
    super.key,
    this.color,
    required this.letter,
    required this.isDraggable,
    this.targetColor,
  });

  @override
  State<TreeLetter> createState() => _TreeLetterState();
}

Color? targetColor;

class _TreeLetterState extends State<TreeLetter> {
  @override
  Widget build(BuildContext context) {
    bool showDraggable = ((targetColor == letterCColor));
    targetColor = widget.targetColor;
    return widget.isDraggable
        ? IgnorePointer(
      ignoring: !showDraggable,
      child: Opacity(
        opacity: showDraggable ? 1 : 0,
        child: Draggable<Color>(
          data: widget.color,
          feedback: RotatedBox(
            quarterTurns: 1,
            child: Text(
              widget.letter,
              style: GoogleFonts.grandstander(
                color: widget.color,
                fontSize: 109.25,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          child: Text(
            widget.letter,
            style: GoogleFonts.grandstander(
              color: widget.color,
              fontSize: 109.25,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    )
        : DragTarget<Color>(
      onAccept: (data) {
        setState(
              () {
            targetColor = data;
          },
        );
      },
      builder: (context, _, __) => Container(
        width: 100,
        height: 100,
        child: Center(
          child: Text(
            widget.letter,
            style: GoogleFonts.grandstander(
              color: targetColor,
              fontSize: 109.25,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
