class Vector < Gdx::Vector2
  %i[+ - * /].each do |operator|
    define_method operator do |other|
      t = self.class.new
      if other.is_a? self.class
        t.x = x.to_f.send operator, other.x
        t.y = y.to_f.send operator, other.y
      else
        t.x = x.to_f.send operator, other
        t.y = y.to_f.send operator, other
      end
      t
    end
  end

  def normalize
    nor
  end

  def normalize!
    normalized = normalize
    self.x = normalized.x
    self.y = normalized.y
  end
end
