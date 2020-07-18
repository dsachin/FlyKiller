import 'dart:ui';

import 'package:flame/sprite.dart';
import '../fly_killer.dart';
import 'fly.dart';

class AgileFly extends Fly {
  double get speed => flyKiller.tileSize * 5;
  AgileFly(FlyKiller flyKiller, double x, double y) : super(flyKiller) {
    flyRect = Rect.fromLTWH(
        x, y, flyKiller.tileSize * 1.25, flyKiller.tileSize * 1.25);
    flyingSprite = List();
    flyingSprite.add(Sprite('flies/agile-fly-1.png'));
    flyingSprite.add(Sprite('flies/agile-fly-2.png'));
    deadSprite = Sprite('flies/agile-fly-dead.png');
  }
}
