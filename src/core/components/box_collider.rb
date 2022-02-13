class BoxCollider < Collider
  attr_accessor :size

  def initialize
    super
    @shape = Gdx::PolygonShape.new
    self.size = Vector.new 1, 1
    # TODO: Support size change in runtime.
    @shape.set_as_box size.x, size.y
  end
end
