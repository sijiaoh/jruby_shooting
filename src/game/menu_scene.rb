class MenuScene < Scene
  def update
    super
    GameScene.new.to_current if Gdx::Gdx.input.isKeyPressed(Gdx::Input::Keys::ENTER)
  end

  def draw
    super
    Font.draw "エンターを押せ！", Vector.new(0, 0)
  end
end
