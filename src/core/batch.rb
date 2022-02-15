class Batch
  class << self
    attr_accessor :batch

    delegate_missing_to :batch

    def create
      self.batch = Gdx::SpriteBatch.new
    end
  end
end
