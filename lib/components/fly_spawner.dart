import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:magarra/components/base/fly.dart';

import '../langaw_game.dart';
import 'base/base_controler.dart';
import 'flies/agile_fly.dart';
import 'flies/drooler_fly.dart';
import 'flies/house_fly.dart';
import 'flies/hungry_fly.dart';
import 'flies/macho_fly.dart';

class FlySpawner extends BaseControler{
  final int _maxSpawnInterval = 3000;
  final int _minSpawnInterval = 250;
  final int _intervalChange = 3;
  final int _maxFliesOnScreen = 7;
  int _currentInterval;
  int _nextSpawn;

  int _livingFlies = 0;

  List<Fly> _flies = [];


  FlySpawner(LangawGame game) :super(game){
    _start();
    _spawnFly();
  }

  void _start() {
    _killAll();
    _currentInterval = _maxSpawnInterval;
    _nextSpawn = DateTime.now().millisecondsSinceEpoch + _currentInterval;

  }

  void _killAll() {
    _flies.forEach((fly) => fly.kill());
    _livingFlies = 0;
  }

  @override
  void update(double t) {

    int nowTimeStamp = DateTime.now().millisecondsSinceEpoch;

    if(nowTimeStamp > _nextSpawn && _livingFlies < _maxFliesOnScreen){
      _spawnFly();
      if(_currentInterval > _minSpawnInterval){
        _currentInterval -= _intervalChange;
        _currentInterval -= (_currentInterval * .02).toInt();
      }
      _nextSpawn = _currentInterval + nowTimeStamp;
    }

    _updateFlies(t);
  }


//  bool _isFlyTriggered(double x, double y) {
//    bool triggered = false;
//    _flies.forEach((fly) {
//      if (Fly.isTriggered(x, y, fly)) {
//        triggered = true;
//      }
//    });
//
//    return triggered;
//  }

  bool _onTap(Offset click){
    bool tapped = false;
    _flies.forEach((fly) {
      if (fly.isTapped(click)) {
        fly.kill();
        _livingFlies--;
        tapped = true;
      }
    });

    return tapped;
  }

  void _spawnFly() {

    // 2.025 our biggest fly is now 2.025x tile size
    double x = game.rnd.nextDouble() * (game.screenSize.width - (LangawGame.tileSize * 2.025));
    double y = game.rnd.nextDouble() * (game.screenSize.height - (LangawGame.tileSize * 2.025));

//      bool triggered = isFlyTriggered(x, y);
    bool triggered = false;

    if (!triggered) {
      _flies.add(_createRandomFly(x, y));
      _livingFlies++;
    }

  }

  Fly _createRandomFly(double x, double y) {
    Fly fly = HouseFly(game,x:x,y: y);
    switch (game.rnd.nextInt(5)) {
      case 0:
        fly = HouseFly(game,x:x,y: y);
        break;
      case 1:
        fly = DroolerFly(game,x:x,y: y);
        break;
      case 2:
        fly = AgileFly(game,x:x,y: y);
        break;
      case 3:
        fly = MachoFly(game,x:x,y: y);
        break;
      case 4:
        fly = HungryFly(game,x:x,y: y);
        break;
    }

    return fly;
  }

  void _renderFlies(Canvas c){
    _flies.forEach((fly) => fly.render(c));
  }

  void _updateFlies(double t){
    _flies.forEach((fly) => fly.update(t));

    _flies.removeWhere((fly) => fly.offScreen);
  }

  @override
  void render(Canvas c) {
    _renderFlies(c);
  }


  bool onTapDown(TapDownDetails d) {
    return _onTap(d.globalPosition);
  }
}