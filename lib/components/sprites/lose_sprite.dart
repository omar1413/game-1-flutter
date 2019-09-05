import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:magarra/components/base/base_sprite.dart';
import 'package:magarra/langaw_game.dart';
import '../../utils/images.dart' as Images;
class LoseSprite extends BaseSprite{


  LoseSprite(LangawGame game, {double width, double height,double x,double y}) : super(game, width:width, height:height,x:x,y:y){

    sprite = Sprite(Images.loseSplash);

  }

  @override
  void init() {

    width = width ?? LangawGame.tileSize * 7;
    height = height ?? LangawGame.tileSize * 5;
    x = x ?? centerToScreen.dx;
    y = y ?? centerToScreen.dy;
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