class Font
  class << self
    attr_accessor :font

    delegate :dispose, to: :font

    def draw(str, x, y)
      font.draw Batch.batch, str, x, y
    end

    def create
      self.font = Gdx::BitmapFont.new true
    end
  end
end
