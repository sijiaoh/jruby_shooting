class Collider < Component
  attr_reader :shape, :fixture

  def sensor?
    !!@sensor
  end

  def sensor=(value)
    @sensor = value
    @fixture.set_sensor value
  end

  def create_fixture(body)
    fixture_def = Gdx::FixtureDef.new
    fixture_def.shape = shape
    @fixture = body.create_fixture fixture_def
  end
end
