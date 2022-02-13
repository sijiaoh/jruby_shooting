class Bullet < GameObject
  def create
    super
    add_components [
      BulletAi.new,
      StraightMover.new,
      SpriteRenderer.new("./assets/textures/bullet.png"),
      RigidBody.new,
      BoxCollider.new
    ]
  end
end
