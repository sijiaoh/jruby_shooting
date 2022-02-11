class Texture
  attr_accessor :original

  def initialize(path)
    self.original = Gdx::Texture.new Gdx::Gdx.files.internal(path)
  end

  def dispose
    original.dispose
  end
end
