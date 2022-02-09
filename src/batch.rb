java_import com.badlogic.gdx.graphics.g2d.SpriteBatch

class Batch
  class << self
    attr_accessor :batch

    delegate :begin, :end, :dispose, to: :batch

    def create
      self.batch = SpriteBatch.new
    end
  end
end
