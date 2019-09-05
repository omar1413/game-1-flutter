import 'package:flutter/gestures.dart';
import 'package:magarra/components/sprites/dialog_sprite.dart';
import 'package:magarra/langaw_game.dart';
import 'package:magarra/views/base_view.dart';
import '../utils/images.dart' as Images;

class HelpView extends View{

  DialogSprite dialogSprite;

  HelpView(LangawGame game) : super(game){
    dialogSprite = DialogSprite(game, Images.dialogHelp);
    components = [dialogSprite];
  }



  @override
  void update(double t) {
    // TODO: implement update
  }


  @override
  bool onTapDown(TapDownDetails d){

    game.home();
    return true;
  }


}