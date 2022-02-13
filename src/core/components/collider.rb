class Collider < Component
  class << self
    def issue_id
      @id ||= 0
      @id += 1
    end

    def add_collider(collider)
      colliders << collider
    end

    def remove_collider(collider)
      colliders.delete collider
    end

    def find_collider_by_fixture(fixture)
      colliders.find { |collider| collider.id == fixture.get_user_data }
    end

    private

    def colliders
      @@colliders ||= [] # rubocop:disable Style/ClassVars
    end
  end

  attr_reader :id, :shape, :fixture

  def initialize
    super
    @id = self.class.issue_id
  end

  def create
    super
    self.class.add_collider self
  end

  def dispose
    super
    self.class.remove_collider self
  end

  def sensor?
    !!@sensor
  end

  def sensor=(value)
    @sensor = value
    @fixture&.set_sensor value
  end

  def create_fixture(body)
    fixture_def = Gdx::FixtureDef.new
    fixture_def.shape = shape
    @fixture = body.create_fixture fixture_def
    @fixture.set_user_data id
    @fixture.set_sensor sensor?
  end
end
