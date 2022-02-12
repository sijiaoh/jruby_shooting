class Physics
  class << self
    attr_reader :instance

    delegate :update, :dispose, to: :instance

    def create
      @instance = Physics.new
    end
  end

  def initialize
    @world = Gdx::World.new Vector.new(0, 9.8).to_gdx_vector2, true
  end

  def update
    @world.step Time.delta, 6, 2
  end

  def dispose
    @world.dispose
  end
end
