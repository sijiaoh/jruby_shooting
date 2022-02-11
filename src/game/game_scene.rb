class GameScene < Scene
  def show
    super
    Ship.new
  end

  def draw
    super
    Font.draw "すべて倒せ！", 0, 0
  end
end
