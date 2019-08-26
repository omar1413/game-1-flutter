import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'langaw_game.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/flame.dart';
import 'utils/images.dart' as Images;

void main() async {
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  await Flame.images.loadAll(<String>[
    Images.backyardBackground,
    Images.agileFly1,
    Images.agileFly2,
    Images.agileFlyDead,
    Images.droolerFly1,
    Images.droolerFly2,
    Images.droolerFlyDead,
    Images.houseFly1,
    Images.houseFly2,
    Images.houseFlyDead,
    Images.hungryFly1,
    Images.hungryFly2,
    Images.hungryFlyDead,
    Images.machoFly1,
    Images.machoFly2,
    Images.machoFlyDead,
    Images.loseSplash,
    Images.title,
    Images.dialogCredits,
    Images.dialogHelp,
    Images.iconCredits,
    Images.iconHelp,
    Images.startButton,
  ]);

  final game = LangawGame();
  runApp(game.widget);

  final tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapper);
}
