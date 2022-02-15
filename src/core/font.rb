class Font
  class << self
    attr_accessor :original, :generator

    def draw(str, position, scale = 1)
      original.get_data.set_scale scale * 0.05
      original.draw Batch.batch, str, position.x, position.y
    end

    def create
      ttf = Gdx::Gdx.files.internal "./assets/fonts/misaki_gothic.ttf"
      self.generator = Gdx::FreeTypeFontGenerator.new ttf

      param = Gdx::FreeTypeFontGenerator::FreeTypeFontParameter.new
      param.characters = File.read "./assets/fonts/japanese-full.txt", encoding: Encoding::UTF_8
      param.flip = true

      self.original = generator.generate_font param
      original.set_use_integer_positions false
    end

    def dispose
      original.dispose
      generator.dispose
    end
  end
end
