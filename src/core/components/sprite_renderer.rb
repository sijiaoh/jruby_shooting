class SpriteRenderer < Component
  attr_accessor :offset, :size

  attr_reader :sprite

  def initialize(path)
    super()
    @sprite = Sprite.new path
    self.offset = Vector.new
    self.size = Vector.new 1, 1
  end

  def update
    super
    sprite.position = game_object.position + offset
    sprite.size = size
  end

  def draw
    super
    sprite.draw
  end

  def dispose
    sprite.dispose
    super
  end
end
