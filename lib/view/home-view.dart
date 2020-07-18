import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:fly_killer/fly_killer.dart';

class HomeView {
  final FlyKiller fly;
  Rect titleRect;
  Sprite titleSprite;

  HomeView(this.fly) {
    titleRect = Rect.fromLTWH(
        fly.tileSize,
        (fly.screenSize.height / 2) - (fly.tileSize * 4),
        fly.tileSize * 7,
        fly.tileSize * 4);
    titleSprite = Sprite("branding/title.png");
  }
  void render(Canvas c) {
    titleSprite.renderRect(c, titleRect);
  }

  void update(double t) {}
}
