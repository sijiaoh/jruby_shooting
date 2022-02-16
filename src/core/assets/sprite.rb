class Sprite < Gdx::Sprite
  attr_reader :position, :size

  def initialize(path)
    super Texture.new path
  end

  def dispose
    texture.dispose
  end

  def draw
    super Batch.batch
  end

  def position=(value)
    @position = value
    set_position position.x, position.y
  end

  def size=(value)
    @size = value
    set_size size.x, size.y
  end
end
