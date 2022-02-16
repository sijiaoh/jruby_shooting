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
    parent_position + local_position
  end

  def position=(value)
    self.local_position = value - parent_position
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

  def add_components(components)
    components.each { |component| add_component(component) }
  end

  def remove_component(component)
    return if components.exclude? component

    components.delete component
    component.game_object = nil
  end

  def get_component(klass)
    components.find { |component| component.is_a? klass }
  end

  def get_components(klass)
    components.filter { |component| component.is_a? klass }
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

  def update
    components.each { |component| component.create unless component.created? }
    components.each(&:update)
  end

  def dispose
    return if disposed?

    components.first.dispose while components.present?
    children.first.dispose while children.present?
    self.parent = nil
    Scene.current&.remove_game_object self
    @disposed = true
  end

  def begin_contact(collider)
    components.each { |component| component.begin_contact collider }
  end

  def end_contact(collider)
    components.each { |component| component.end_contact collider }
  end

  private

  def parent_position
    parent&.position || Vector.new
  end
end
