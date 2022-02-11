class Component
  attr_reader :game_object

  def created?
    @created ||= false
  end

  def game_object=(value)
    return if game_object == value

    @game_object&.remove_component self
    @game_object = value
    @game_object&.add_component self
  end

  GameObject::COMPONENT_LIFECYCLES.each do |method|
    define_method(method) {} # Do nothing.
  end

  def create
    @created = true
  end

  def dispose
    self.game_object = nil
  end
end
