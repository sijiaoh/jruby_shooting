class Ship < GameObject
  def create
    super
    add_component PlayerMove.new
    add_component SpriteRenderer.new("./assets/textures/ship.png")
  end
end
