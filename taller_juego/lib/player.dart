import 'package:flame/cache.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:taller_juego/enemy.dart';

import 'my_game.dart';

class Player extends SpriteAnimationComponent with CollisionCallbacks, HasGameRef<MyGame>{
  Images images;
  double startY=0.0;
  double startX=0.0;
  double speedY=0.0;
  bool isCrash=false;
  Player(this.images);
  @override
  Future<void>onLoad()async{
    animation = SpriteAnimation.fromFrameData(
        images.fromCache('run.png'),
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            amountPerRow: 4,
            textureSize: Vector2(
              294, 409
            )));

    add(SpriteAnimationComponent(
      animation: animation
    ));
  }

  @override
  void onMount(){
    y = startY;
    x = startX;
    add(RectangleHitbox());
    super.onMount();
  }

  @override
  void onCollision(Set<Vector2>intersectionPoint,PositionComponent other){

    if((other is Enemy) && (!isCrash)){
      crash();
    }
    super.onCollision(intersectionPoint,other);
  }

  crash(){
    isCrash = true;
    gameRef.pauseEngine();
  }

  @override
  void onGameResize(Vector2 size) {
    startY = size.y-(size.y/5);
    startX = 100;
    // TODO: implement onGameResize
    super.onGameResize(size);
  }

  jump(){
    if(isOnGround) {
      speedY = 20;
    }
  }

  @override
  update(double dt){
    y-=speedY;
    speedY = speedY-1;

    if(isOnGround){
      y = startY;
      speedY = 0.0;
    }
    super.update(dt);
  }

  bool get isOnGround => (y >= startY);
}