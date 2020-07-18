import 'dart:math';
import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:flutter/gestures.dart';
import 'package:fly_killer/components/help-button.dart';
import 'package:fly_killer/components/score-disaply.dart';
import 'package:fly_killer/components/spawnController.dart';
import 'package:fly_killer/components/start-button.dart';
import 'package:fly_killer/fly/agile-fly.dart';
import 'package:fly_killer/fly/hungry-fly.dart';
import 'package:fly_killer/view/help-view.dart';
import 'package:fly_killer/view/home-view.dart';
import 'package:fly_killer/view/lost-view.dart';
import 'package:fly_killer/view/views.dart';
import 'view/backyard.dart';
import 'fly/drooler-fly.dart';
import 'fly/fly.dart';
import 'fly/house-fly.dart';
import 'fly/macho-fly.dart';

class FlyKiller extends Game {
  View activeView = View.home;
  Size screenSize;
  double tileSize;
  List<Fly> flies;
  Random rnd;
  Backyard background;
  HomeView homeView;
  StartButton startButton;
  LostView lostView;
  SpawnController spawnController;
  HelpButton helpButton;
  HelpView helpView;
  int score;
  ScoreDisplay scoreDisplay;

  FlyKiller() {
    initialize();
  }
  initialize() async {
    rnd = Random();
    flies = List<Fly>();
    resize(await Flame.util.initialDimensions());
    homeView = HomeView(this);
    startButton = StartButton(this);
    background = Backyard(this);
    lostView = LostView(this);
    spawnController = SpawnController(this);
    helpButton = HelpButton(this);
    helpView = HelpView(this);
    score = 0;
    scoreDisplay = ScoreDisplay(this);
  }

  void spawnfly() {
    double x = rnd.nextDouble() * (screenSize.width - tileSize * 2.025);
    double y = rnd.nextDouble() * (screenSize.height - tileSize * 2.025);
    switch (rnd.nextInt(5)) {
      case 0:
        flies.add(HouseFly(this, x, y));
        break;
      case 1:
        flies.add(DroolerFly(this, x, y));
        break;
      case 2:
        flies.add(MachoFly(this, x, y));
        break;
      case 3:
        flies.add(HungryFly(this, x, y));
        break;
      case 4:
        flies.add(AgileFly(this, x, y));
        break;
    }
  }

  void render(Canvas canvas) {
    background.render(canvas);
    flies.forEach((Fly fly) => fly.render(canvas));

    if (activeView == View.home) {
      homeView.render(canvas);
      startButton.render(canvas);
      helpButton.render(canvas);
    } else if (activeView == View.lost) {
      lostView.render(canvas);
      startButton.render(canvas);
      helpButton.render(canvas);
    }
    if (activeView == View.help) helpView.render(canvas);
    if (activeView == View.play) scoreDisplay.render(canvas);
  }

  void update(double t) {
    spawnController.update(t);
    flies.forEach((Fly fly) => fly.update(t));
    flies.removeWhere((Fly fly) => fly.isOffScreen);
    if (activeView == View.play) scoreDisplay.update(t);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void onTapDown(TapDownDetails d) {
    bool isHandled = false;

    if (!isHandled && activeView == View.help) {
      activeView = View.home;
      isHandled = true;
    }
    if (!isHandled &&
        startButton.rect.contains(d.globalPosition) &&
        (activeView == View.home || activeView == View.lost)) {
      startButton.onTapDown();
      isHandled = true;
    }

    if (!isHandled &&
        helpButton.rect.contains(d.globalPosition) &&
        (activeView == View.home || activeView == View.lost)) {
      helpButton.onTapDown();
    }

    if (!isHandled) {
      bool didHitFly = false;
      flies.forEach((Fly fly) {
        if (fly.flyRect.contains(d.globalPosition)) {
          fly.onTapDown();
          isHandled = true;
          didHitFly = true;
        }
      });

      if (!didHitFly && activeView == View.play) {
        activeView = View.lost;
      }
    }
  }
}
