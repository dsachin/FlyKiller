import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/painting.dart';
import 'package:fly_killer/fly/fly.dart';
import 'package:fly_killer/view/views.dart';

class Callout {
  Fly fly;
  Sprite sprite;
  Rect rect;
  double value;

  TextPainter tp;
  TextStyle textStyle;
  Offset textOffset;

  Callout(this.fly) {
    sprite = Sprite('ui/callout.png');
    value = 1;
    tp = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textStyle = TextStyle(
      color: Color(0xff000000),
      fontSize: 15,
    );
  }

  void update(double t) {
    if (fly.flyKiller.activeView == View.play) {
      value = value - 0.5 * t;
      if (value <= 0) {
        fly.flyKiller.activeView = View.lost;
      }
      rect = Rect.fromLTWH(
        fly.flyRect.left - (fly.flyKiller.tileSize * .25),
        fly.flyRect.top - (fly.flyKiller.tileSize * .5),
        fly.flyKiller.tileSize * .75,
        fly.flyKiller.tileSize * .75,
      );
      tp.text = TextSpan(
        text: (value * 10).toInt().toString(),
        style: textStyle,
      );
      tp.layout();
      textOffset = Offset(
        rect.center.dx - (tp.width / 2),
        rect.top + (rect.height * .4) - (tp.height / 2),
      );
    }
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
    tp.paint(c, textOffset);
  }
}
