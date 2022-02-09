class Scene
  java_implements com.badlogic.gdx.Screen

  INTERFACE_METHODS = %i[
    dispose
    hide
    pause
    render
    resize
    resume
    show
  ].freeze

  def method_missing(name, *args, &block)
    super(name, *args, &block) if INTERFACE_METHODS.exclude? name.to_sym
  end

  def respond_to_missing?(sym, _include_private)
    INTERFACE_METHODS.include? sym
  end

  def update; end
end
