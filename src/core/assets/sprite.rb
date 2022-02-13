class Sprite
  attr_reader :texture, :original, :position, :size

  def initialize(path)
    @texture = Texture.new path
    @original = Gdx::Sprite.new texture.original
  end

  def dispose
    texture.dispose
  end

  def draw
    original.draw Batch.batch
  end

  def position=(value)
    @position = value
    original.set_position position.x, position.y
  end

  def size=(value)
    @size = value
    original.set_size size.x, size.y
  end
end
