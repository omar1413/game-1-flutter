import 'dart:ui';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import '../langaw_game.dart';
import '../utils/images.dart' as Images;

class Backyard extends Component {
  Sprite bgSprite;
  LangawGame game;
  Rect bgRect;

  Backyard(this.game) {
    bgSprite = Sprite(Images.backyardBackground);
    bgRect = Rect.fromLTWH(0, game.screenSize.height - (LangawGame.tileSize * 23),
        LangawGame.tileSize * 9, LangawGame.tileSize * 23);
  }

  @override
  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  @override
  void update(double t) {}
}
