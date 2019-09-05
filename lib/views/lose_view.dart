
import 'package:magarra/components/buttons/credits_button.dart';
import 'package:magarra/components/buttons/help_button.dart';
import 'package:magarra/components/sprites/lose_sprite.dart';
import 'package:magarra/components/buttons/start_button.dart';
import 'package:magarra/langaw_game.dart';
import 'package:magarra/views/base_view.dart';

class LoseView extends View{

  StartButton button;
  LoseSprite lose;

  HelpButton helpButton;
  CreditsButton creditsButton;


  LoseView(LangawGame game) : super(game){
    lose = LoseSprite(game);
    button = StartButton(game);
    helpButton = HelpButton(game);
    creditsButton = CreditsButton(game);

    components = [lose, button,helpButton,creditsButton];
  }




  @override
  void update(double t) {
    // TODO: implement update
  }

}