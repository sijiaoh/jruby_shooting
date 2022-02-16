class PlayerBulletShooter < Component
  def update
    super
    shoot if Input.down? :space
  end

  private

  def shoot
    bullet = Bullet.new
    bullet.position = position
  end
end
