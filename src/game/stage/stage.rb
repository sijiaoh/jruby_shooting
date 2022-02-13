class Stage < GameObject
  def create
    super
    @timer = 0
    @wave = 0
  end

  def update
    super
    wave_update
  end

  private

  def wave_update
    @timer += Time.delta
    return unless @timer > 1

    @wave.times do
      enemy = Enemy.new
      x = rand * 5
      enemy.position = Vector.new x, 0
    end

    @wave += 1
    @timer = 0
  end
end
