require "./src/core/game_object/component"

class SpriteRenderer < Component
  attr_accessor :sprite, :texture, :offset

  def initialize(path)
    super()
    self.texture = Texture.new path
    self.sprite = Gdx::Sprite.new texture.original
    self.offset = Vector.new
  end

  def draw
    super
    sprite.draw Batch.batch
  end

  def dispose
    texture.dispose
    super
  end
end
