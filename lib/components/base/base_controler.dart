

import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:magarra/langaw_game.dart';

abstract class BaseControler extends Component{

  LangawGame game;

  BaseControler(this.game) ;

  @override
  void render(Canvas c) {

  }

  @override
  void update(double t) {

  }

}