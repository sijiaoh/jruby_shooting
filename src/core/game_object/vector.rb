class Vector
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
      t.x = x.to_f.send(operator, other.x)
      t.y = y.to_f.send(operator, other.y)
      t
    end
  end
end
