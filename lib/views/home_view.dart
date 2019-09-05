
import 'package:magarra/components/buttons/credits_button.dart';
import 'package:magarra/components/buttons/help_button.dart';
import 'package:magarra/components/buttons/start_button.dart';
import 'package:magarra/components/sprites/title_sprite.dart';
import 'package:magarra/langaw_game.dart';
import 'package:magarra/views/base_view.dart';

class HomeView extends View{


  StartButton startButton;
  TitleSprite title;

  HelpButton helpButton;
  CreditsButton creditsButton;



  HomeView(LangawGame game) : super(game){


    title = TitleSprite(game);
    startButton = StartButton(game);
    helpButton = HelpButton(game);
    creditsButton = CreditsButton(game);

    components = [title, startButton,helpButton, creditsButton];
  }



  @override
  void update(double t) {

  }



}