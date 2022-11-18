import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:taller_juego/enemy.dart';
import 'package:taller_juego/player.dart';

class MyGame extends FlameGame with TapDetector,HasCollisionDetection {

  late Player player;
  @override
  Color backgroundColor()=>Colors.red;

  static const imageAssets = [
    'run.png' ,
    'bug.png'
  ];
  @override
  Future<void>onLoad()async{

    await images.loadAll(imageAssets);

    final parallaxBackGround = await loadParallaxComponent(
      [
        ParallaxImageData("parallax/plx-1.png"),
        ParallaxImageData("parallax/plx-2.png"),
        ParallaxImageData("parallax/plx-3.png"),
        ParallaxImageData("parallax/plx-4.png"),
        ParallaxImageData("parallax/plx-5.png"),
      ],
      baseVelocity: Vector2(50, 0),
      repeat: ImageRepeat.repeatX,
      velocityMultiplierDelta: Vector2(1.4,0 )
    );
     player = Player(images);
    Enemy enemy = Enemy(images);
    add(parallaxBackGround);
    add(player
      ..size=(Vector2.all(100))
      ..anchor=Anchor.center);
    add(enemy..size=Vector2.all(100)
    ..anchor=Anchor.bottomRight);
  }

  @override
  void onTap(){
    player.jump();
  }
}