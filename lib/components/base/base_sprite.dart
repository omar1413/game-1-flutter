import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';
import 'package:magarra/components/base/base_component.dart';
import 'package:magarra/langaw_game.dart';

abstract class BaseSprite extends BaseComponent{
  BaseSprite(LangawGame game,{double width, double height,double x,double y}) : super(game,width:width, height:height,x:x,y:y);

  Sprite sprite;
  @override
  void onTapDown(TapDownDetails d) {
  }

}