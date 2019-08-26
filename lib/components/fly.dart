import 'dart:ui';
import 'package:flame/components/component.dart';
import 'package:magarra/langaw_game.dart';
import 'package:flutter/material.dart';
import 'package:flame/sprite.dart';

abstract class Fly extends Component {
  final LangawGame game;

  bool isDead = false;
  bool offScreen = false;

  Rect flyRect;

  List<Sprite> flySprites;
  Sprite deadSprite;
  double flySpriteIndex = 0;
  Offset targetLocation;
  double speed;

  Fly(
      {@required this.game,
      double x = 0,
      double y = 0,
      double widthFactor = 1,
      double heightFactor = 1})
      : assert(game != null) {
    flyRect = Rect.fromLTWH(
        x, y, game.tileSize * widthFactor, game.tileSize * heightFactor);

    speed = game.tileSize * 3;
    _setTarget();
  }

  void _setTarget() {
    double x = game.rnd.nextDouble() * (game.screenSize.width - flyRect.width);
    double y =
        game.rnd.nextDouble() * (game.screenSize.height - flyRect.height);

    targetLocation = Offset(x, y);
  }

  @override
  void render(Canvas c) {
    if (flySprites.length == 0 || deadSprite == null) {
      return;
    }
    if (!isDead) {
      flySprites[flySpriteIndex.toInt()].renderRect(c, flyRect.inflate(2));
    } else {
      deadSprite.renderRect(c, flyRect.inflate(2));
    }
  }

  void _move(double t) {
    double stepDistance = speed * t;
    Offset toTarget = targetLocation - Offset(flyRect.left, flyRect.top);
    if (stepDistance < toTarget.distance) {
      Offset stepTarget =
          Offset.fromDirection(toTarget.direction, stepDistance);
      flyRect = flyRect.shift(stepTarget);
    } else {
      flyRect = flyRect.shift(toTarget);
      _setTarget();
    }
  }

  @override
  void update(double t) {
    flySpriteIndex += 30 * t;
    while (flySpriteIndex >= 2) {
      flySpriteIndex -= 2;
    }
    if (isDead) {
      flyRect = flyRect.translate(0, 10 * game.tileSize * t);
    } else {
      _move(t);
    }

    if (flyRect.top > game.screenSize.height) {
      offScreen = true;
    }
  }

  bool isTapped(Offset offset) {
    return flyRect.contains(offset);
  }

  void onTapDown() {
    isDead = true;
    game.spawnFly();
  }

  static bool isTriggered(double x, double y, Fly fly) {
    var topLeftOffset = Offset(x, y);
    var topRightOffset = Offset(x + fly.flyRect.width, y);
    var bottomLeftOffset = Offset(x, y + fly.flyRect.height);
    var bottomRightOffset =
        Offset(x + fly.flyRect.width, y + fly.flyRect.height);

    bool topLeftTrigger = fly.isTapped(topLeftOffset);
    bool topRightTrigger = fly.isTapped(topRightOffset);
    bool bottomLeftTrigger = fly.isTapped(bottomLeftOffset);
    bool bottomRightTrigger = fly.isTapped(bottomRightOffset);

    return topLeftTrigger ||
        topRightTrigger ||
        bottomLeftTrigger ||
        bottomRightTrigger;
  }
}
