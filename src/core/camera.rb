class Camera
  PIXEL_PER_UNIT = 32

  class << self
    attr_accessor :original

    def created?
      @created ||= false
    end

    def create
      return if created?

      self.original = Gdx::OrthographicCamera.new
      resize
      @created = true
    end

    def update
      original.update
      Batch.batch.set_projection_matrix(original.combined)
    end

    def resize
      screen_pixel = self.screen_pixel
      original.set_to_ortho true, screen_pixel.x, screen_pixel.y
    end

    def screen_pixel
      pixels_to_unit = 1.0 / PIXEL_PER_UNIT
      screen_width = Gdx::Gdx.graphics.get_width
      screen_height = Gdx::Gdx.graphics.get_height
      Vector.new screen_width * pixels_to_unit, screen_height * pixels_to_unit
    end
  end
end
