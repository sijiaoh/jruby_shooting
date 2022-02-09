java_import com.badlogic.gdx.Game
java_import com.badlogic.gdx.utils.ScreenUtils
java_import com.badlogic.gdx.backends.lwjgl3.Lwjgl3Application
java_import com.badlogic.gdx.backends.lwjgl3.Lwjgl3ApplicationConfiguration

class Application < Game
  class << self
    attr_accessor :instance, :current_scene

    def run(scene)
      self.current_scene = scene
      Lwjgl3Application.new(Application.new, Lwjgl3ApplicationConfiguration.new)
    end

    def change_scene(scene)
      current_scene.dispose
      self.current_scene = scene
      instance.set_screen current_scene
    end
  end

  def create
    self.class.instance = self

    Batch.create
    Font.create

    set_screen current_scene
  end

  def dispose
    current_scene.dispose
    Font.dispose
    Batch.dispose
  end

  def current_scene
    self.class.current_scene
  end
end
