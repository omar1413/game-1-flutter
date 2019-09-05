import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';
import 'package:magarra/components/base/base_button.dart';
import 'package:magarra/langaw_game.dart';
import '../../utils/images.dart' as Images;
class HelpButton extends BaseButton{

  Sprite sprite;

  HelpButton(LangawGame game) : super(game);

  @override
  void init() {
    width = width ?? LangawGame.tileSize;
    height = height ?? LangawGame.tileSize;
    x = x ??  (width * 0.25);
    y = y ?? game.screenSize.height - (height * 1.25);

    sprite = Sprite(Images.iconHelp);
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
  void onTapDown(TapDownDetails d) {
    game.helpView();
  }

}