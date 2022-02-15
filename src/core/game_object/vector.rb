class Vector
  def self.from_gdx_vector2(vector2)
    new vector2.x, vector2.y
  end

  attr_reader :x, :y

  def initialize(x = 0, y = 0)
    self.x = x.to_f
    self.y = y.to_f
  end

  def x=(value)
    @x = value.to_f
  end

  def y=(value)
    @y = value.to_f
  end

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

  def to_gdx_vector2
    Gdx::Vector2.new x, y
  end

  def normalize
    self.class.from_gdx_vector2 to_gdx_vector2.nor
  end

  def normalize!
    normalized = normalize
    self.x = normalized.x
    self.y = normalized.y
  end
end
