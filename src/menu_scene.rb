java_import com.badlogic.gdx.Gdx
java_import com.badlogic.gdx.Input

class MenuScene < Scene
  def draw
    MainScene.new.to_current if Gdx.input.isKeyPressed(Input::Keys::SPACE)
    Font.draw "Press enter!", 100, 100
  end
end
