import 'dart:ui';
import 'package:flame/game.dart';
import 'package:magarra/views/base_view.dart';
import 'package:magarra/views/credits_view.dart';
import 'package:magarra/views/help_view.dart';
import 'package:magarra/views/home_view.dart';
import 'package:flame/flame.dart';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:magarra/views/lose_view.dart';
import 'package:magarra/views/palying_view.dart';
import './components/backyard.dart';


class LangawGame extends Game {
  Size screenSize;
  static double _tileSize = 0;


  Backyard backyardBackground;


  View gameView;



  final Random rnd = Random();

  LangawGame() {
    init();
  }

  static get tileSize => _tileSize;

  void onTapDown(TapDownDetails d) {
      gameView.onTapDown(d);

  }



  void init() async {
    resize(await Flame.util.initialDimensions());
    spawnBackground();
    gameView = HomeView(this);
  }

  @override
  void render(Canvas canvas) {
    renderBackground(canvas);
    gameView.render(canvas);

  }

  @override
  void update(double t) {
    gameView.update(t);
  }



  @override
  void resize(Size size) {
    screenSize = size;
    _tileSize = screenSize.width / 9;
  }

  void renderBackground(Canvas canvas) {
    backyardBackground.render(canvas);
  }

  void spawnBackground() {
    backyardBackground = Backyard(this);
  }

  void play(){
    gameView = PlayingView(this);
  }

  void lose(){
    gameView = LoseView(this);
  }

  void home(){
    gameView = HomeView(this);
  }

  void creditsView(){
    gameView = CreditsView(this);
  }

  void helpView(){
    gameView = HelpView(this);
  }



}
