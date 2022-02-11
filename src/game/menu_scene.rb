class MenuScene < Scene
  def draw
    super
    GameScene.new.to_current if Gdx::Gdx.input.isKeyPressed(Gdx::Input::Keys::SPACE)
    Font.draw "Press enter!", 100, 100
  end
end
