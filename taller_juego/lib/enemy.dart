import 'package:flame/cache.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Enemy extends SpriteAnimationComponent with CollisionCallbacks{
  Images images;
  Enemy(this.images);
  Future<void>onLoad()async{
    animation = SpriteAnimation.fromFrameData(
        images.fromCache('bug.png'),
        SpriteAnimationData.sequenced(
            amount: 2,
            stepTime: 0.15,
            amountPerRow: 2,
            textureSize: Vector2(
                582, 482
            )));

    add(SpriteAnimationComponent(
        animation: animation
    ));
  }
  @override
  void onMount(){
    size *= 0.6;
    add(RectangleHitbox());
    super.onMount();
  }

  @override
  void onGameResize(Vector2 size) {
    y = size.y-(size.y/6);
    x = size.x;
    // TODO: implement onGameResize
    super.onGameResize(size);
  }

  @override
  void update(double dt){
    position.x -= 80 * dt;
    super.update(dt);
  }

}