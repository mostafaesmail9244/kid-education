import 'package:flutter/material.dart';

/// it will return SizedBox.shrink();
const empty = SizedBox.shrink();

/// gap 2*2
const space2 = _Space(2);

/// gap 4*4
const space4 = _Space(4);

/// gap 6*6
const space6 = _Space(6);

/// gap 8*8
const space8 = _Space(8);

/// gap 10*10
const space10 = _Space(10);

/// gap 12*12
const space12 = _Space(12);

/// gap 11*11
const space11 = _Space(11);

/// gap 14*14
const space14 = _Space(14);

/// gap 16*16
const space16 = _Space(16);

/// gap 18*18
const space18 = _Space(18);

/// gap 24*24
const space24 = _Space(24);

/// gap 26*26
const space26 = _Space(26);

/// gap 28*28
const space28 = _Space(28);

/// gap 36*36
const space36 = _Space(36);

/// gap 48*48
const space48 = _Space(48);

const spaceH = SizedBox(width: double.infinity);

const spaceW = SizedBox(width: double.infinity);

class _Space extends StatelessWidget {
  const _Space(this.size);
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: size, height: size);
  }
}
