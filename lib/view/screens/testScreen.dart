import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kid_education/core/constant/color.dart';
import 'package:kid_education/view/widgets/primary_scaffold_widget.dart';

import '../../shared/components/components.dart';

class Test extends StatefulWidget {
  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  Color targetColor = letterAColor;
  Color targetColor2 = letterBColor;

  @override
  Widget build(BuildContext context) {
    bool showDraggable1 = ((targetColor == letterAColor));
    bool showDraggable2 = ((targetColor2 == letterBColor));

    return
      PrimaryScaffold(
    appBar: defaultAppBar(context: context,isLeading: true,),
    body: Center(
      child:  Column(
        children: [
          IgnorePointer(
            ignoring: !showDraggable1,
            child: Opacity(
              opacity: showDraggable1 ? 1 : 0,
              child: Draggable<Color>(
                data: Colors.blue,
                feedback: RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    "A",
                    style: GoogleFonts.grandstander(
                      color: Colors.blue,
                      fontSize: 109.25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                child: Text(
                  'A',
                  style: GoogleFonts.grandstander(
                    color: Colors.blue,
                    fontSize: 109.25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          DragTarget<Color>(
            onAccept: (data) => setState(
                  () {
                print('//////////////////////$data');
                targetColor = data;
              },
            ),
            builder: (context, _, __) => Container(
              height: 100,
              width: 100,
              child: Center(
                child: Text(
                  'A',
                  style: GoogleFonts.grandstander(
                    color: targetColor,
                    fontSize: 109.25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 50,),
          IgnorePointer(
            ignoring: !showDraggable2,
            child: Opacity(
              opacity: showDraggable2 ? 1 : 0,
              child: Draggable<Color>(
                data: Colors.red,
                feedback: RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    "B",
                    style: GoogleFonts.grandstander(
                      color: Colors.red,
                      fontSize: 109.25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                child: Text(
                  'B',
                  style: GoogleFonts.grandstander(
                    color: Colors.red,
                    fontSize: 109.25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),


          DragTarget<Color>(
            onAccept: (data) {
              setState(
                  () {
                targetColor2 = data;
              },
            );
            },
            builder: (context, _, __) => SizedBox(
              height: 100,
              width: 100,
              child: Center(
                child: Text(
                  'B',
                  style: GoogleFonts.grandstander(
                    color: targetColor2,
                    fontSize: 109.25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          )

        ],
      ),
    ),
);

  }
}



