class Texture < Gdx::TextureRegion
  def initialize(path)
    texture = Gdx::Texture.new Gdx::Gdx.files.internal(path)
    super texture
    flip false, true
  end

  def dispose
    texture.dispose
  end
end
