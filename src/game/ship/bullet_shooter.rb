class BulletShooter < Component
  def update
    super
    shoot
  end

  private

  def shoot
    return unless Input.down? :space

    bullet = Bullet.new
    bullet.position = position
  end
end
