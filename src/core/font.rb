class Font
  class << self
    attr_accessor :font, :generator

    def draw(str, x, y, scale = 1)
      font.get_data.set_scale scale * 0.05
      font.draw Batch.batch, str, x, y
    end

    def create
      ttf = Gdx::Gdx.files.internal("./assets/fonts/misaki_gothic.ttf")
      self.generator = Gdx::FreeTypeFontGenerator.new ttf

      param = Gdx::FreeTypeFontGenerator::FreeTypeFontParameter.new
      param.characters = File.read("./assets/fonts/japanese-full.txt", encoding: Encoding::UTF_8)
      param.flip = true

      self.font = generator.generate_font param
      font.set_use_integer_positions false
    end

    def dispose
      font.dispose
      generator.dispose
    end
  end
end
