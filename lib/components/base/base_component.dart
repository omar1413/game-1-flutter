import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flutter/cupertino.dart';
import 'package:magarra/langaw_game.dart';

abstract class BaseComponent extends Component{


  final LangawGame game;
   double width;
   double height;
  Rect rect;
  double x;
  double y;

  BaseComponent(this.game, {this.width, this.height,this.x, this.y }){
    init();
  }


  Offset get centerToScreen  => Offset((game.screenSize.width / 2) - (width / 2) , (game.screenSize.height / 2) - (height / 2));


  bool isTapped(Offset offset) {
    return rect.contains(offset);
  }

  void init(){
    assert(x != null || y != null || width != null || height != null);
    rect = Rect.fromLTWH(
        x, y, width, height);
  }

  void onTapDown(TapDownDetails d);

}