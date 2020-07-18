import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:fly_killer/fly_killer.dart';

import 'fly.dart';

class DroolerFly extends Fly {
  double get speed => flyKiller.tileSize * 2;

  DroolerFly(FlyKiller flyKiller, double x, double y) : super(flyKiller) {
    flyRect =
        Rect.fromLTWH(x, y, flyKiller.tileSize * 1.5, flyKiller.tileSize * 1.5);
    flyingSprite = List();
    flyingSprite.add(Sprite('flies/drooler-fly-1.png'));
    flyingSprite.add(Sprite('flies/drooler-fly-2.png'));
    deadSprite = Sprite('flies/drooler-fly-dead.png');
  }
}
