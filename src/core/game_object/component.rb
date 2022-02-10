require "./src/core/game_object/game_object"

class Component
  attr_reader :game_object

  def game_object=(value)
    return if game_object == value

    @game_object = value
    value&.add_component self
  end

  GameObject::COMPONENT_LIFECYCLES.each do |method|
    define_method(method) {} # Do nothing.
  end
end
