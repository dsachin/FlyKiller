import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:fly_killer/fly_killer.dart';
import 'fly.dart';

class HungryFly extends Fly {
  double get speed => flyKiller.tileSize * 1.5;

  HungryFly(FlyKiller flykiller, double x, double y) : super(flykiller) {
    flyRect = Rect.fromLTWH(
        x, y, flyKiller.tileSize * 1.38, flyKiller.tileSize * 1.38);
    flyingSprite = List();
    flyingSprite.add(Sprite('flies/hungry-fly-1.png'));
    flyingSprite.add(Sprite('flies/hungry-fly-2.png'));
    deadSprite = Sprite('flies/hungry-fly-dead.png');
  }
}
