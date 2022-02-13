class Ship < GameObject
  def create
    super
    add_component ShipMover.new
    add_component SpriteRenderer.new("./assets/textures/ship.png")

    rigid_body = RigidBody.new
    rigid_body.body_type = :dynamic
    add_component rigid_body

    add_component BoxCollider.new
  end
end
