class Vector
  attr_accessor :x, :y

  def initialize(x = 0, y = 0)
    self.x = x.to_f
    self.y = y.to_f
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
