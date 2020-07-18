import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:fly_killer/fly_killer.dart';

class HelpView {
  final FlyKiller flyKiller;
  Sprite sprite;
  Rect rect;
  HelpView(this.flyKiller) {
    rect = Rect.fromLTWH(
      flyKiller.tileSize * .5,
      (flyKiller.screenSize.height / 2) - (flyKiller.tileSize * 6),
      flyKiller.tileSize * 8,
      flyKiller.tileSize * 12,
    );
    sprite = Sprite('ui/dialog-help.png');
  }
  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }
}
