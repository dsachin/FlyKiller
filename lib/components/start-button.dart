import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:fly_killer/fly_killer.dart';
import 'package:fly_killer/view/views.dart';

class StartButton {
  final FlyKiller flyKiller;

  Rect rect;
  Sprite sprite;
  StartButton(this.flyKiller) {
    rect = Rect.fromLTWH(
        flyKiller.tileSize * 1.5,
        (flyKiller.screenSize.height * 0.75) - (flyKiller.tileSize * 1.5),
        flyKiller.tileSize * 6,
        flyKiller.tileSize * 3);
    sprite = Sprite("ui/start-button.png");
  }
  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void update(double t) {}

  void onTapDown() {
    flyKiller.activeView = View.play;
    flyKiller.spawnController.start();
    flyKiller.score = 0;
  }
}
