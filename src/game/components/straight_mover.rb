class StraightMover < Component
  attr_accessor :direction, :speed

  def initialize
    super
    self.direction = Vector.new
    self.speed = 1
  end

  def create
    super
    @rigid_body = get_component RigidBody
  end

  def update
    super
    @rigid_body.move = direction.normalize * speed
  end
end
