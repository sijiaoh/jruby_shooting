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

  def render(delta)
    update(delta)

    ScreenUtils.clear(0, 0, 0, 1)
    Batch.begin
    draw
    Batch.end
  end

  def update(delta); end

  def draw; end

  def to_current
    Application.change_scene self
  end
end
