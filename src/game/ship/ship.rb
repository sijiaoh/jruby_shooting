class Ship < GameObject
  def create
    super
    add_component ShipMover.new
    add_component SpriteRenderer.new("./assets/textures/ship.png")
    add_component RigidBody.new :dynamic
  end
end
