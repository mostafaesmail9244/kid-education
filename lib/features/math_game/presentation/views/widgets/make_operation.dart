import 'package:flutter/material.dart';
import 'package:kid_education/core/utils/styles.dart';

class MakeOperation extends StatelessWidget {
  const MakeOperation({super.key,required this.controller,required this.onsaved,required this.text1,required this.text2,required
   this.text3,required this.text4});

final int text1;
final String text2;
final int text3;
final String text4;
final Function(String?) onsaved;
final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1.toString(),
          style: Styles.style70,
        ),
        Text(
          text2,
          style: Styles.style70,
        ),
        Text(
          text3.toString(),
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
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            keyboardType: TextInputType.number,
            onChanged: onsaved,
            controller: controller,
          ),
        )
      ],
    );
  }
}
