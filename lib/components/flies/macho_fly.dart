import '../base/fly.dart';
import '../../langaw_game.dart';
import 'package:flame/sprite.dart';
import '../../utils/images.dart' as Images;

class MachoFly extends Fly {

  MachoFly(LangawGame game, {double width, double height, double x, double y}) : super(game, width:width, height:height, x:x, y:y){

    flySprites = [];
    flySprites.add(Sprite(Images.machoFly1));
    flySprites.add(Sprite(Images.machoFly2));

    deadSprite = Sprite(Images.machoFlyDead);
    speed = speed * 0.8;

  }

  @override
  void init() {

    width = width ?? LangawGame.tileSize * 2.025;
    height = height ?? LangawGame.tileSize * 2.025;
    x = x ?? 0;
    y = y ?? 0;
    super.init();
  }


  //  MachoFly({LangawGame game, double x = 0, double y = 0})
//      : super(game: game, x: x, y: y, widthFactor: 2.025, heightFactor: 2.025) {
//    flySprites = [];
//    flySprites.add(Sprite(Images.machoFly1));
//    flySprites.add(Sprite(Images.machoFly2));
//
//    deadSprite = Sprite(Images.machoFlyDead);
//    speed = speed * 0.8;
//  }
}
