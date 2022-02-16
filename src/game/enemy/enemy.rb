class Enemy < GameObject
  def create
    super

    @sprite_renderer = add_component SpriteRenderer.new("./assets/textures/meteor.png")

    initialize_straight_mover
    initialize_rigid_body
    initialize_box_collider
  end

  def begin_contact(collider)
    super
    collider.game_object.dispose if collider.game_object.is_a? Ship
  end

  private

  def initialize_straight_mover
    @straight_mover = add_component StraightMover.new
    @straight_mover.direction = Vector.new 0, 1
    @straight_mover.speed = 5
  end

  def initialize_rigid_body
    @rigid_body = add_component RigidBody.new
    @rigid_body.body_type = :dynamic
  end

  def initialize_box_collider
    @box_collider = add_component BoxCollider.new
    @box_collider.sensor = true
  end
end
