import 'dart:ui';
import 'package:flame/game.dart';
import 'components/fly.dart';
import 'package:flame/flame.dart';
import 'dart:math';
import 'package:flutter/gestures.dart';
import './components/backyard.dart';
import './components/house_fly.dart';
import './components/agile_fly.dart';
import './components/drooler_fly.dart';
import './components/hungry_fly.dart';
import './components/macho_fly.dart';
import 'package:synchronized/synchronized.dart';

class LangawGame extends Game {
  Size screenSize;
  double tileSize = 0;
  List<Fly> flies = [];
  Backyard backyardBackground;
  var lock = Lock();

  final Random rnd = Random();

  LangawGame() {
    init();
  }

  void onTapDown(TapDownDetails d) {
    lock.synchronized(() {
      flies.forEach((fly) {
        if (fly.isTapped(d.globalPosition)) {
          fly.onTapDown();
        }
      });
    });
  }

  bool isFlyTriggered(double x, double y) {
    bool triggered = false;
    flies.forEach((fly) {
      if (Fly.isTriggered(x, y, fly)) {
        triggered = true;
      }
    });

    return triggered;
  }

  void spawnFly() {
    lock.synchronized(() {
      // 2.025 our biggest fly is now 2.025x tile size
      double x = rnd.nextDouble() * (screenSize.width - (tileSize * 2.025));
      double y = rnd.nextDouble() * (screenSize.height - (tileSize * 2.025));

//      bool triggered = isFlyTriggered(x, y);
      bool triggered = false;

      if (!triggered) {
        flies.add(createRandomFly(x, y));
      }
    });
  }

  Fly createRandomFly(double x, double y) {
    Fly fly = HouseFly(game: this, x: x, y: y);
    switch (rnd.nextInt(5)) {
      case 0:
        fly = HouseFly(game: this, x: x, y: y);
        break;
      case 1:
        fly = DroolerFly(game: this, x: x, y: y);
        break;
      case 2:
        fly = AgileFly(game: this, x: x, y: y);
        break;
      case 3:
        fly = MachoFly(game: this, x: x, y: y);
        break;
      case 4:
        fly = HungryFly(game: this, x: x, y: y);
        break;
    }

    return fly;
  }

  void init() async {
    resize(await Flame.util.initialDimensions());
    spawnBackground();
    spawnFly();
    spawnFly();
    spawnFly();
    spawnFly();
    spawnFly();
    spawnFly();
  }

  @override
  void render(Canvas canvas) {
    renderBackground(canvas);
    flies.forEach((fly) => fly.render(canvas));
  }

  @override
  void update(double t) {
    flies.forEach((fly) => fly.update(t));

    flies.removeWhere((fly) => fly.offScreen);
  }

  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void renderBackground(Canvas canvas) {
    backyardBackground.render(canvas);
  }

  void spawnBackground() {
    backyardBackground = Backyard(this);
  }
}
