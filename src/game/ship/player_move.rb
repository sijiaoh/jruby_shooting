class PlayerMove < Component
  attr_accessor :speed

  def create
    super
    self.speed = 100
  end

  def update # rubocop:disable Metrics/AbcSize
    super
    position = game_object.local_position

    position.y -= speed * Time.delta if Gdx::Gdx.input.isKeyPressed(Gdx::Input::Keys::W)
    position.y += speed * Time.delta if Gdx::Gdx.input.isKeyPressed(Gdx::Input::Keys::S)
    position.x -= speed * Time.delta if Gdx::Gdx.input.isKeyPressed(Gdx::Input::Keys::A)
    position.x += speed * Time.delta if Gdx::Gdx.input.isKeyPressed(Gdx::Input::Keys::D)

    game_object.local_position = position
  end
end
