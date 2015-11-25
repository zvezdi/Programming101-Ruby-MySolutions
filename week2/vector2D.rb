class Vector2D
  include Math

  def initialize(x, y)
    @x, @y = x, y
  end

  def x
    @x
  end

  def x=(value)
    @x = value
  end

  def y
    @y
  end

  def y=(value)
    @y = value
  end

  def length
    Math.hypot(@x, @y)
  end

  def normalize
    #Vector2D.new @x / length, @y / length
    @x, @y = @x / length, @y / length

    self
  end

  def ==(other)
    @x == other.x and @y == other.y
  end

  def +(other)
    Vector2D.new @x + other.x, @y + other.y
  end

  def -(other)
    Vector2D.new @x - other.x, @y - other.y
  end

  def *(scalar)
    Vector2D.new @x * scalar, @y * scalar
  end

  def /(scalar)
    Vector2D.new @x / scalar, @y / scalar
  end

  def dot(other)
    @x * other.x + @y * other.y
  end

  def to_s #puts calls implicitly to_s
    "(#{@x}, #{@y})"
  end
end