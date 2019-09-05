import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:magarra/components/base/base_component.dart';
import 'package:magarra/langaw_game.dart';

abstract class View{

  final LangawGame game;
  List<BaseComponent> components = [];

  View(this.game);

  void update(double t){
    components.forEach((com) => com.update(t));
  }

  void render(Canvas c){
    components.forEach((com) => com.render(c));
  }

  bool onTapDown(TapDownDetails d) {
    bool tapped = false;
    components.forEach((component){
      if(component.isTapped(d.globalPosition)){
        component.onTapDown(d);
        tapped = true;
      }
    });

    return tapped;
  }

  //Offset get centerToScreen  => Offset((game.screenSize.width / 2) - (_width / 2) , (game.screenSize.height / 2) - (_height / 2));

}