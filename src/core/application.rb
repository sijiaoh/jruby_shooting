class Application < Gdx::Game
  class << self
    attr_accessor :instance, :current_scene

    def run(scene)
      self.current_scene = scene
      Gdx::Lwjgl3Application.new Application.new, Gdx::Lwjgl3ApplicationConfiguration.new
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
