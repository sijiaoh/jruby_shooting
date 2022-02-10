require "./src/core/game_object/game_object"

class Component
  attr_accessor :game_object

  def method_missing(name, *args, &block)
    super(name, *args, &block) if GameObject::COMPONENT_LIFECYCLES.exclude? name.to_sym
  end

  def respond_to_missing?(sym, _include_private)
    GameObject::COMPONENT_LIFECYCLES.include? sym
  end
end
