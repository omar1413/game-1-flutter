import 'dart:ui';
import 'package:magarra/components/fly_spawner.dart';
import 'package:magarra/langaw_game.dart';
import 'package:magarra/views/base_view.dart';
import 'package:flutter/gestures.dart';

class PlayingView extends View{


  FlySpawner flySpawner;

  PlayingView(LangawGame game) : super(game){
    flySpawner = FlySpawner(game);


  }

  @override
  bool onTapDown(TapDownDetails d) {

    bool tapped = flySpawner.onTapDown(d);

    if(!tapped){
      game.lose();
    }

    return tapped;
  }

  @override
  void update(double t) {
    flySpawner.update(t);
  }

  @override
  void render(Canvas c) {
    flySpawner.render(c);
  }




}