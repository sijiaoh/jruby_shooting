class Scene
  def self.current
    Application.current_scene
  end

  java_implements com.badlogic.gdx.Screen

  %i[dispose hide pause resume show update draw].each do |method|
    define_method(method) do
      game_objects.each { |go| go.send(method) } if GameObject::COMPONENT_LIFECYCLES.include? method
    end
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

  def game_objects
    @game_objects ||= []
  end

  def add_game_object(game_object)
    game_objects << game_object
  end

  def remove_game_object(game_object)
    game_objects.delete game_object
  end

  def to_current
    Application.change_scene self
  end
end
