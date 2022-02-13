class BoxCollider < Collider
  attr_accessor :size

  def initialize
    super
    @shape = Gdx::PolygonShape.new
    self.size = Vector.new 1, 1
  end

  def update
    @shape.set_as_box size.x, size.y
  end
end
