import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:magarra/components/base/base_sprite.dart';
import 'package:magarra/langaw_game.dart';

class DialogSprite extends BaseSprite{

  DialogSprite(LangawGame game,String spriteUri,{double width, double height,double x,double y}) : super(game,width:width,height:height,x:x,y:y){

    this.sprite = Sprite(spriteUri);
  }



  @override
  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }


  @override
  void init() {

    width = width ?? LangawGame.tileSize * 8;
    height = height ?? LangawGame.tileSize * 12;
    x = x ?? LangawGame.tileSize * 0.5;
    y = y ?? centerToScreen.dy;
    super.init();
  }

  @override
  void update(double t) {
    // TODO: implement update
  }

}