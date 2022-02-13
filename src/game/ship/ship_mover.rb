class ShipMover < Component
  attr_accessor :speed

  def create
    super
    self.speed = 3
    @rigid_body = get_component RigidBody
  end

  def update
    super
    direction = Vector.new

    direction.y = -1 if Input.enter? :w
    direction.y = 1 if Input.enter? :s
    direction.x = -1 if Input.enter? :a
    direction.x = 1 if Input.enter? :d

    @rigid_body.move = direction.normalize * speed
  end
end
