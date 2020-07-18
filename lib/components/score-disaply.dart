import 'dart:ui';

import 'package:flutter/painting.dart';
import 'package:fly_killer/fly_killer.dart';

class ScoreDisplay {
  final FlyKiller flyKiller;
  TextStyle textStyle;
  TextPainter painter;
  Offset position;

  ScoreDisplay(this.flyKiller) {
    painter = TextPainter(
        textAlign: TextAlign.center, textDirection: TextDirection.ltr);

    textStyle = TextStyle(
        color: Color(0xffffffff),
        fontSize: 90,
        shadows: <Shadow>[
          Shadow(blurRadius: 7, color: Color(0xff000000), offset: Offset(3, 3))
        ]);
    position = Offset.zero;
  }
  void render(Canvas c) {
    painter.paint(c, position);
  }

  void update(double t) {
    if ((painter.text?.text ?? '') != flyKiller.score.toString()) {
      painter.text =
          TextSpan(text: flyKiller.score.toString(), style: textStyle);
      painter.layout();
      position = Offset((flyKiller.screenSize.width / 2) - painter.width / 2,
          (flyKiller.screenSize.height * 0.25) - painter.height / 2);
    }
  }
}
