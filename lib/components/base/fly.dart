import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:magarra/components/base/base_component.dart';
import 'package:magarra/langaw_game.dart';

abstract class Fly extends BaseComponent {

  bool isDead = false;
  bool offScreen = false;

  List<Sprite> flySprites;
  Sprite deadSprite;
  double flySpriteIndex = 0;
  Offset targetLocation;
  double speed;

  Fly(LangawGame game, {double width, double height,double x, double y}) : super(game, width:width, height:height,x:x,y:y){

    speed = LangawGame.tileSize * 3;
    _setTarget();

  }

//  Fly(
//      {@required this.game,
//      double x = 0,
//      double y = 0,
//      double widthFactor = 1,
//      double heightFactor = 1})
//      : assert(game != null) {
//    flyRect = Rect.fromLTWH(
//        x, y, game.tileSize * widthFactor, game.tileSize * heightFactor);
//
//    speed = game.tileSize * 3;
//    _setTarget();
//  }

  void _setTarget() {
    double x = game.rnd.nextDouble() * (game.screenSize.width - rect.width);
    double y =
        game.rnd.nextDouble() * (game.screenSize.height - rect.height);

    targetLocation = Offset(x, y);
  }

  @override
  void render(Canvas c) {
    if (flySprites.length == 0 || deadSprite == null) {
      return;
    }
    if (!isDead) {
      flySprites[flySpriteIndex.toInt()].renderRect(c, rect.inflate(2));
    } else {
      deadSprite.renderRect(c, rect.inflate(2));
    }
  }

  void _move(double t) {
    double stepDistance = speed * t;
    Offset toTarget = targetLocation - Offset(rect.left, rect.top);
    if (stepDistance < toTarget.distance) {
      Offset stepTarget =
          Offset.fromDirection(toTarget.direction, stepDistance);
      rect = rect.shift(stepTarget);
    } else {
      rect = rect.shift(toTarget);
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
      rect = rect.translate(0, 10 * LangawGame.tileSize * t);
    } else {
      _move(t);
    }

    if (rect.top > game.screenSize.height) {
      offScreen = true;
    }
  }

  void kill() {
    isDead = true;
  }




  static bool isTriggered(double x, double y, Fly fly) {
    var topLeftOffset = Offset(x, y);
    var topRightOffset = Offset(x + fly.rect.width, y);
    var bottomLeftOffset = Offset(x, y + fly.rect.height);
    var bottomRightOffset =
        Offset(x + fly.rect.width, y + fly.rect.height);

    bool topLeftTrigger = fly.isTapped(topLeftOffset);
    bool topRightTrigger = fly.isTapped(topRightOffset);
    bool bottomLeftTrigger = fly.isTapped(bottomLeftOffset);
    bool bottomRightTrigger = fly.isTapped(bottomRightOffset);

    return topLeftTrigger ||
        topRightTrigger ||
        bottomLeftTrigger ||
        bottomRightTrigger;
  }

  @override
  void onTapDown(TapDownDetails d) {

  }
}
