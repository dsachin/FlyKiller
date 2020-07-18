import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:fly_killer/fly_killer.dart';
import 'fly.dart';

class MachoFly extends Fly {
  double get speed => flyKiller.tileSize * 2.5;

  MachoFly(FlyKiller flyKiller, double x, double y) : super(flyKiller) {
    flyRect = Rect.fromLTWH(
        x, y, flyKiller.tileSize * 2.025, flyKiller.tileSize * 2.025);
    flyingSprite = List();
    flyingSprite.add(Sprite('flies/macho-fly-1.png'));
    flyingSprite.add(Sprite('flies/macho-fly-2.png'));
    deadSprite = Sprite('flies/macho-fly-dead.png');
  }
}
