class Batch
  class << self
    attr_accessor :batch

    delegate :begin, :end, :dispose, to: :batch

    def create
      self.batch = Gdx::SpriteBatch.new
    end
  end
end
