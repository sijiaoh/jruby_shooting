class Input
  class << self
    def down?(key)
      Gdx::Gdx.input.isKeyJustPressed(Gdx::Input::Keys.const_get(key.upcase))
    end

    def enter?(key)
      Gdx::Gdx.input.isKeyPressed(Gdx::Input::Keys.const_get(key.upcase))
    end
  end
end
