import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';
import 'package:magarra/components/base/base_button.dart';
import 'package:magarra/langaw_game.dart';
import '../../utils/images.dart' as Images;

class StartButton extends BaseButton{

  Sprite sprite;

  StartButton(LangawGame game, {double width, double height}) : super(game, width:width, height:height){

    sprite = Sprite(Images.startButton);
  }

  @override
  void init() {

    width = width ?? LangawGame.tileSize * 6;
    height = height ?? LangawGame.tileSize * 3;
    x = x ?? centerToScreen.dx;
    y = y ?? (game.screenSize.height * 0.75) - (height / 2);
    super.init();
  }



  @override
  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  @override
  void update(double t) {

  }

  @override
  void onTapDown(TapDownDetails d){
    game.play();
  }

}