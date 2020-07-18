import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:fly_killer/components/callout.dart';
import 'package:fly_killer/fly_killer.dart';
import 'package:fly_killer/view/views.dart';

class Fly {
  Rect flyRect;
  final FlyKiller flyKiller;
  List<Sprite> flyingSprite;
  Sprite deadSprite;
  double flyingSpriteIndex = 0;

  bool isDead = false;
  bool isOffScreen = false;
  double get speed => flyKiller.tileSize * 3;
  Offset targetLocation;
  Callout callout;

  Fly(this.flyKiller) {
    setTargetLocation();
    callout = Callout(this);
  }
  void render(Canvas c) {
    if (isDead) {
      deadSprite.renderRect(c, flyRect.inflate(2));
    } else {
      flyingSprite[flyingSpriteIndex.toInt()].renderRect(c, flyRect.inflate(2));
      if (flyKiller.activeView == View.play) {
        callout.render(c);
      }
    }
  }

  void update(double t) {
    if (isDead) {
      flyRect = flyRect.translate(0, flyKiller.tileSize * 12 * t);
      if (flyRect.top > flyKiller.screenSize.height) {
        isOffScreen = true;
      }
    } else {
      callout.update(t);
      flyingSpriteIndex += 30 * t;

      double stepDistance = speed * t;
      Offset toTarget = targetLocation - Offset(flyRect.left, flyRect.top);
      if (stepDistance < toTarget.distance) {
        Offset stepToTarget =
            Offset.fromDirection(toTarget.direction, stepDistance);
        flyRect = flyRect.shift(stepToTarget);
      } else {
        flyRect = flyRect.shift(toTarget);
        setTargetLocation();
      }

      if (flyingSpriteIndex >= 2) {
        flyingSpriteIndex -= 2;
      }
    }
  }

  void onTapDown() {
    if (!isDead) {
      isDead = true;
      if (flyKiller.activeView == View.play) {
        flyKiller.score++;
      }
    }
  }

  void setTargetLocation() {
    double x = flyKiller.rnd.nextDouble() *
        (flyKiller.screenSize.width - (flyKiller.tileSize * 2.025));
    double y = flyKiller.rnd.nextDouble() *
        (flyKiller.screenSize.height - (flyKiller.tileSize * 2.025));
    targetLocation = Offset(x, y);
  }
}
