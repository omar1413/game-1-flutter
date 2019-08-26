import 'fly.dart';
import '../langaw_game.dart';
import 'package:flame/sprite.dart';
import '../utils/images.dart' as Images;

class AgileFly extends Fly {
  AgileFly({LangawGame game, double x = 0, double y = 0})
      : super(game: game, x: x, y: y, widthFactor: 1.5, heightFactor: 1.5) {
    flySprites = [];
    flySprites.add(Sprite(Images.agileFly1));
    flySprites.add(Sprite(Images.agileFly2));

    deadSprite = Sprite(Images.agileFlyDead);
  }
}
