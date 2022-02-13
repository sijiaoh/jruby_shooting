class EnemyAi < Component
  def create
    super
    initialize_straight_mover
    initialize_rigid_body
    initialize_collider
  end

  def begin_contact(collider)
    super
    collider.game_object.dispose if collider.game_object.is_a? Ship
  end

  private

  def initialize_straight_mover
    straight_mover = get_component StraightMover
    straight_mover.direction = Vector.new 0, 1
    straight_mover.speed = 5
  end

  def initialize_rigid_body
    rigid_body = get_component RigidBody
    rigid_body.body_type = :dynamic
  end

  def initialize_collider
    collider = get_component Collider
    collider.sensor = true
  end
end
