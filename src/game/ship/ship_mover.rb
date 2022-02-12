class ShipMover < Component
  attr_accessor :speed

  def create
    super
    self.speed = 3
  end

  def update # rubocop:disable Metrics/AbcSize
    super
    position = game_object.position

    position.y -= speed * Time.delta if Input.enter? :w
    position.y += speed * Time.delta if Input.enter? :s
    position.x -= speed * Time.delta if Input.enter? :a
    position.x += speed * Time.delta if Input.enter? :d

    game_object.position = position
  end
end
