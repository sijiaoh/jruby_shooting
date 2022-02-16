class Scene
  def self.current
    Application.current_scene
  end

  %i[dispose hide pause resume show update draw create].each do |method|
    define_method method do
      game_objects_call_if_created method if GameObject::COMPONENT_LIFECYCLES.include? method
    end
  end

  def resize(_width, _height)
    Camera.resize
  end

  def render(delta)
    Time.delta = delta

    update

    Gdx::ScreenUtils.clear 0, 0, 0, 1
    Batch.begin
    draw
    Batch.end

    # TODO: Debug mode only.
    Gdx::Box2DDebugRenderer.new.render Physics.world, Camera.combined
  end

  def game_objects
    @game_objects ||= []
  end

  def add_game_object(game_object)
    game_objects << game_object
  end

  def remove_game_object(game_object)
    game_objects.delete game_object
  end

  def to_current
    Application.change_scene self
  end

  # Do not call game_objects create
  def create; end

  def show
    Camera.create unless Camera.created?
    Physics.create
    create
  end

  def update
    game_objects.dup.each { |game_object| game_object.create unless game_object.created? }
    game_objects_call_if_created :update
    Camera.update
    Physics.update
  end

  def dispose
    game_objects_call_if_created :dispose
    Physics.dispose
  end

  private

  def game_objects_call_if_created(method)
    game_objects.dup.each { |game_object| game_object.send method if game_object.created? }
  end
end
