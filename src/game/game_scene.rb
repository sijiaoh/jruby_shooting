class GameScene < Scene
  def create
    super
    Stage.new
    ship = Ship.new
    ship.position = Vector.new 5, 5
  end

  def draw
    super
    Font.draw "すべて倒せ！", Vector.new(0, 0)
  end
end
