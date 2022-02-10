require "./src/core/game_object/game_object"

class Component
  attr_accessor :game_object

  GameObject::COMPONENT_LIFECYCLES.each do |method|
    define_method(method) {} # Do nothing.
  end
end
