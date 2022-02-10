class Scene
  java_implements com.badlogic.gdx.Screen

  %i[dispose hide pause resume show].each do |method|
    define_method(method) {} # Do nothing.
  end

  def resize(width, height); end

  def render(delta)
    Time.delta = delta

    update

    ScreenUtils.clear(0, 0, 0, 1)
    Batch.begin
    draw
    Batch.end
  end

  def update; end

  def draw; end

  def to_current
    Application.change_scene self
  end
end
