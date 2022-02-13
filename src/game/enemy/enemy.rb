class Enemy < GameObject
  def create
    super
    add_components [
      EnemyAi.new,
      StraightMover.new,
      SpriteRenderer.new("./assets/textures/meteor.png"),
      RigidBody.new,
      BoxCollider.new
    ]
  end
end
