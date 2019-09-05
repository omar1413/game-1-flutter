import 'package:flutter/gestures.dart';
import 'package:magarra/components/sprites/dialog_sprite.dart';
import 'package:magarra/langaw_game.dart';
import 'package:magarra/views/base_view.dart';
import '../utils/images.dart' as Images;

class CreditsView extends View{

  DialogSprite dialogSprite;

  CreditsView(LangawGame game) : super(game){
    dialogSprite = DialogSprite(game, Images.dialogCredits);
    components = [dialogSprite];
  }



  @override
  void update(double t) {}


  @override
  bool onTapDown(TapDownDetails d){

    game.home();
    return true;
  }

}