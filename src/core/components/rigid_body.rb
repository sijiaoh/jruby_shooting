class RigidBody < Component
  attr_accessor :move

  attr_reader :body_type, :body

  def initialize
    super
    @body_type = :static
    self.move = Vector.new
  end

  def create
    super
    @body = Physics.world.create_body body_def
    create_fixtures
  end

  def update
    super
    @body.set_linear_velocity move.x, move.y
    sync_position
  end

  def body_type=(type)
    @body_type = type
    @body&.type = gdx_type
  end

  def dispose
    super
    @body.dispose
  end

  private

  def gdx_type
    case body_type
    when :dynamic
      Gdx::BodyDef::BodyType::DynamicBody
    when :static
      Gdx::BodyDef::BodyType::StaticBody
    when :kinematic
      Gdx::BodyDef::BodyType::KinematicBody
    else
      raise "Illegal collider body type#{body_type}."
    end
  end

  def sync_position
    game_object.position = Vector.from_gdx_vector2 @body.get_position
  end

  def create_fixtures
    game_object.get_components(Collider).each do |component|
      component.create_fixture body
    end
  end

  def body_def
    body_def = Gdx::BodyDef.new
    body_def.type = gdx_type
    body_def.position.set position.x, position.y
    body_def
  end
end
