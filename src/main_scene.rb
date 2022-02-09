require "./src/scene"

class MainScene < Scene
  def render(_delta)
    Font.draw "hello world", 100, 100
  end
end
