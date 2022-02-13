class Physics
  class ContactListener
    def begin_contact(contact)
      a = Collider.find_collider_by_fixture contact.fixture_a
      b = Collider.find_collider_by_fixture contact.fixture_b

      return if a.nil? || b.nil?

      a.game_object&.begin_contact b
      b.game_object&.begin_contact a
    end

    def end_contact(contact)
      a = Collider.find_collider_by_fixture contact.fixture_a
      b = Collider.find_collider_by_fixture contact.fixture_b

      return if a.nil? || b.nil?

      a.game_object&.end_contact b
      b.game_object&.end_contact a
    end

    def pre_solve(contact, old_manifold); end
    def post_solve(contact, impulse); end
  end

  class << self
    attr_accessor :velocity
    attr_reader :instance

    delegate :world, :update, :dispose, to: :instance

    def create
      self.velocity ||= 9.8
      @instance = Physics.new
      @instance.create
    end
  end

  attr_reader :world

  def create
    @world = Gdx::World.new Vector.new(0, self.class.velocity).to_gdx_vector2, true
    @world.set_contact_listener ContactListener.new
  end

  def update
    @world.step Time.delta, 6, 2
  end

  def dispose
    @world.dispose
  end
end
