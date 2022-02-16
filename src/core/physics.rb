class Physics
  class ContactListener
    def begin_contact(contact)
      a = Collider.find_collider_by_fixture contact.fixture_a
      b = Collider.find_collider_by_fixture contact.fixture_b

      return if a.nil? || b.nil?

      Physics.add_begin_contacted a, b
    end

    def end_contact(contact)
      a = Collider.find_collider_by_fixture contact.fixture_a
      b = Collider.find_collider_by_fixture contact.fixture_b

      return if a.nil? || b.nil?

      Physics.add_end_contacted a, b
    end

    def pre_solve(contact, old_manifold); end
    def post_solve(contact, impulse); end
  end

  class << self
    attr_accessor :velocity
    attr_reader :instance

    delegate_missing_to :instance

    def create
      self.velocity ||= 9.8
      @instance = Physics.new
      @instance.create
    end
  end

  attr_reader :world

  delegate_missing_to :world

  def create
    @world = Gdx::World.new Vector.new(0, self.class.velocity), true
    @world.set_contact_listener ContactListener.new
    @begin_contacteds = []
    @end_contacteds = []
  end

  def update
    @world.step Time.delta, 6, 2

    @begin_contacteds.each do |a, b|
      a.game_object&.begin_contact b
      b.game_object&.begin_contact a
    end
    @end_contacteds.each do |a, b|
      a.game_object&.end_contact b
      b.game_object&.end_contact a
    end
  end

  def dispose
    @world.dispose
  end

  def add_begin_contacted(a, b)
    @begin_contacteds << [a, b]
  end

  def add_end_contacted(a, b)
    @end_contacteds << [a, b]
  end
end
