class Ship < GameObject
  def create
    super
    add_component BulletShooter.new
    add_component ShipMover.new
    add_component SpriteRenderer.new("./assets/textures/ship.png")

    rigid_body = RigidBody.new
    rigid_body.body_type = :dynamic
    add_component rigid_body

    add_component BoxCollider.new

    initialize_collider
  end

  private

  def initialize_collider
    collider = get_component Collider
    collider.sensor = true
  end
end
