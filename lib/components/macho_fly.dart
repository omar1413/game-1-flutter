import 'fly.dart';
import '../langaw_game.dart';
import 'package:flame/sprite.dart';
import '../utils/images.dart' as Images;

class MachoFly extends Fly {
  MachoFly({LangawGame game, double x = 0, double y = 0})
      : super(game: game, x: x, y: y, widthFactor: 2.025, heightFactor: 2.025) {
    flySprites = [];
    flySprites.add(Sprite(Images.machoFly1));
    flySprites.add(Sprite(Images.machoFly2));

    deadSprite = Sprite(Images.machoFlyDead);
    speed = speed * 0.8;
  }
}
