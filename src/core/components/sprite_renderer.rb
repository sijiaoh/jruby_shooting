class SpriteRenderer < Component
  attr_accessor :sprite, :offset, :size

  attr_reader :texture

  def initialize(path)
    super()
    @texture = Texture.new path
    self.sprite = Gdx::Sprite.new texture.original
    self.offset = Vector.new
    self.size = Vector.new 1, 1
  end

  def update
    super
    position = game_object.position + offset
    sprite.set_position position.x, position.y
    sprite.set_size size.x, size.y
  end

  def draw
    super
    sprite.draw Batch.batch
  end

  def dispose
    texture.dispose
    super
  end

  def texture=(value)
    @texture = value
    sprite.set_texture value.original
  end
end
