import '../base/fly.dart';
import '../../langaw_game.dart';
import 'package:flame/sprite.dart';
import '../../utils/images.dart' as Images;

class HungryFly extends Fly {


  HungryFly(LangawGame game, {double width, double height, double x, double y}) : super(game, width:width, height:height, x:x, y:y){

    flySprites = [];
    flySprites.add(Sprite(Images.hungryFly1));
    flySprites.add(Sprite(Images.hungryFly2));

    deadSprite = Sprite(Images.hungryFlyDead);

  }

  @override
  void init() {

    width = width ?? LangawGame.tileSize * 1.65;
    height = height ?? LangawGame.tileSize * 1.65;
    x = x ?? 0;
    y = y ?? 0;
    super.init();
  }


  //  HungryFly({LangawGame game, double x = 0, double y = 0})
//      : super(game: game, x: x, y: y, widthFactor: 1.65, heightFactor: 1.65) {
//    flySprites = [];
//    flySprites.add(Sprite(Images.hungryFly1));
//    flySprites.add(Sprite(Images.hungryFly2));
//
//    deadSprite = Sprite(Images.hungryFlyDead);
//  }
}
