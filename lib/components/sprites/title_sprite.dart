import 'dart:ui';

import 'package:magarra/components/base/base_sprite.dart';

import '../../utils/images.dart' as Images;
import 'package:flame/sprite.dart';
import 'package:magarra/langaw_game.dart';

class TitleSprite extends BaseSprite{



  TitleSprite(LangawGame game, {double width, double height,double x,double y}) : super(game, width:width, height:height,x:x,y:y){

    sprite = Sprite(Images.title);

  }

  @override
  void init() {

    width = width ?? LangawGame.tileSize * 7;
    height = height ?? LangawGame.tileSize * 4;
    x = x ?? centerToScreen.dx;
    y = y ?? centerToScreen.dy - (LangawGame.tileSize * 2);
    super.init();
  }

  @override
  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  @override
  void update(double t) {
    // TODO: implement update
  }


}