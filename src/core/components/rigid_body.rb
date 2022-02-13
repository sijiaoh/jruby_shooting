class RigidBody < Component
  attr_reader :body_type, :body

  def initialize(body_type)
    super()
    @body_type = body_type
  end

  def create
    super
    @body_def = Gdx::BodyDef.new
    @body_def.type = gdx_type
    @body_def.position.set position.x, position.y
    @body = Physics.world.create_body @body_def
    create_fixtures
  end

  def update
    super
    sync_position
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
      fixture_def = Gdx::FixtureDef.new
      fixture_def.shape = component.shape
      @body.create_fixture fixture_def
    end
  end
end
