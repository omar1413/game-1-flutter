import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';
import 'package:magarra/components/base/base_button.dart';
import 'package:magarra/langaw_game.dart';
import '../../utils/images.dart' as Images;
class CreditsButton extends BaseButton{

  Sprite sprite;

  CreditsButton(LangawGame game) : super(game);

  @override
  void init() {
    width = width ?? LangawGame.tileSize;
    height = height ?? LangawGame.tileSize;
    x = x ??  game.screenSize.width - (width * 1.25);
    y = y ?? game.screenSize.height - (height * 1.25);

    sprite = Sprite(Images.iconCredits);
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
    game.creditsView();
  }

}