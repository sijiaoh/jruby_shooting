class GameObject
  attr_accessor :components

  def initialize
    self.components = []
  end

  def add_component(component)
    component.game_object = self
    components << component
  end

  COMPONENT_LIFECYCLES = %i[create update draw dispose].freeze
  COMPONENT_LIFECYCLES.each do |f|
    define_method f do
      components.each { |c| c.send f }
    end
  end
end
