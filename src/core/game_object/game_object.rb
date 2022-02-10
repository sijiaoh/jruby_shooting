class GameObject
  attr_accessor :local_position

  attr_reader :parent, :children, :components

  def initialize
    self.local_position = Vector.new
    @children = []
    @components = []
    Scene.current&.add_game_object self
  end

  COMPONENT_LIFECYCLES = %i[create update draw dispose].freeze
  COMPONENT_LIFECYCLES.each do |f|
    define_method(f) { components.each { |c| c.send f } }
  end

  def position
    parent.position + local_position
  end

  def parent=(value)
    return if parent == value

    @parent&.remove_child self
    @parent = value
    @parent&.add_child self
  end

  def add_child(child)
    return if children.include? child

    children << child
    child.parent = self
  end

  def remove_child(child)
    return if children.exclude? child

    children.delete child
    child.parent = nil
  end

  def add_component(component)
    return if components.include? component

    components << component
    component.game_object = self
  end

  def remove_component(component)
    return if components.exclude? component

    components.delete component
    component.game_object = nil
  end

  def created?
    @created ||= false
  end

  def disposed?
    @disposed ||= false
  end

  def create
    @created = true
  end

  def dispose
    components.each(&:dispose)
    self.parent = nil
    Scene.current&.remove_game_object self
    @disposed = true
  end
end
