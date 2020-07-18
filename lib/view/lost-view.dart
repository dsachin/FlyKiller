import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:fly_killer/fly_killer.dart';

class LostView {
  final FlyKiller fly;
  Rect rect;
  Sprite sprite;

  LostView(this.fly) {
    rect = Rect.fromLTWH(
      fly.tileSize,
      (fly.screenSize.height / 2) - (fly.tileSize * 5),
      fly.tileSize * 7,
      fly.tileSize * 5,
    );
    sprite = Sprite('bg/lose-splash.png');
  }
  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void update() {}
}
