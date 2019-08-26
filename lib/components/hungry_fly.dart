import 'fly.dart';
import '../langaw_game.dart';
import 'package:flame/sprite.dart';
import '../utils/images.dart' as Images;

class HungryFly extends Fly {
  HungryFly({LangawGame game, double x = 0, double y = 0})
      : super(game: game, x: x, y: y, widthFactor: 1.65, heightFactor: 1.65) {
    flySprites = [];
    flySprites.add(Sprite(Images.hungryFly1));
    flySprites.add(Sprite(Images.hungryFly2));

    deadSprite = Sprite(Images.hungryFlyDead);
  }
}
