require "forwardable"

java_import com.badlogic.gdx.graphics.g2d.BitmapFont

class Font
  class << self
    attr_accessor :font

    delegate :dispose, to: :font

    def draw(str, x, y)
      font.draw Batch.batch, str, x, y
    end

    def create
      self.font = BitmapFont.new
    end
  end
end
