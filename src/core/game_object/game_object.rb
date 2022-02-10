class GameObject
  attr_accessor :local_position, :components

  attr_reader :parent, :children

  def initialize
    self.local_position = Vector.new
    @children = []
    self.components = []
    Scene.current&.add_game_object self
  end

  def position
    parent.position + local_position
  end

  def parent=(value)
    return if parent == value

    @parent = value
    value.add_child self
  end

  def add_child(child)
    return if children.include? child

    children << child
    child.parent = self
  end

  def add_component(component)
    component.game_object = self
    components << component
  end

  def dispose
    components.each(&:dispose)
    Scene.current&.remove_game_object self
  end

  COMPONENT_LIFECYCLES = %i[create update draw].freeze
  COMPONENT_LIFECYCLES.each do |f|
    define_method f do
      components.each { |c| c.send f }
    end
  end
end
