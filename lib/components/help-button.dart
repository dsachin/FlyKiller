import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:fly_killer/fly_killer.dart';
import 'package:fly_killer/view/views.dart';

class HelpButton {
  FlyKiller flyKiller;
  Sprite sprite;
  Rect rect;
  HelpButton(this.flyKiller) {
    rect = Rect.fromLTWH(
        flyKiller.tileSize * 0.25,
        flyKiller.screenSize.height - (flyKiller.tileSize * 1.25),
        flyKiller.tileSize,
        flyKiller.tileSize);
    sprite = Sprite("ui/icon-help.png");
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void onTapDown() {
    flyKiller.activeView = View.help;
  }
}
