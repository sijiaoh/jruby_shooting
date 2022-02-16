class Ship < GameObject
  def create
    super

    add_component PlayerBulletShooter.new
    add_component PlayerMover.new
    add_component SpriteRenderer.new("./assets/textures/ship.png")

    initialize_rigid_body
    initialize_box_collider
  end

  private

  def initialize_rigid_body
    @rigid_body = add_component RigidBody.new
    @rigid_body.body_type = :dynamic
  end

  def initialize_box_collider
    @box_collider = add_component BoxCollider.new
    @box_collider.sensor = true
  end
end
