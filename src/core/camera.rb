class Camera
  class << self
    attr_accessor :original

    def created?
      @created ||= false
    end

    def create
      return if created?

      self.original = Gdx::OrthographicCamera.new
      original.set_to_ortho true
      @created = true
    end

    def update
      original.update
      Batch.batch.set_projection_matrix(original.combined)
    end

    def resize
      original.set_to_ortho true
    end
  end
end
