java_import com.badlogic.gdx.Game
java_import com.badlogic.gdx.utils.ScreenUtils
java_import com.badlogic.gdx.backends.lwjgl.LwjglApplication
java_import com.badlogic.gdx.backends.lwjgl.LwjglApplicationConfiguration

class Application < Game
  class << self
    attr_accessor :current_scene

    def run(scene)
      self.current_scene = scene
      LwjglApplication.new(Application.new, LwjglApplicationConfiguration.new)
    end
  end

  def create
    Batch.create
    Font.create
    set_screen current_scene
  end

  def render
    current_scene.update

    ScreenUtils.clear(0, 0, 0, 1)

    Batch.begin
    super
    Batch.end
  end

  def dispose
    Font.dispose
    Batch.dispose
  end

  def current_scene
    self.class.current_scene
  end
end
