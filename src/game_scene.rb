class GameScene < Scene
  def show
    super
    Ship.new
  end

  def draw
    super
    Font.draw "hello world", 100, 100
  end
end
