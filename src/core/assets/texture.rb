class Texture
  attr_accessor :original

  def initialize(path)
    texture = Gdx::Texture.new Gdx::Gdx.files.internal(path)
    self.original = Gdx::TextureRegion.new texture
    original.flip false, true
  end

  def dispose
    original.get_texture.dispose
  end
end
