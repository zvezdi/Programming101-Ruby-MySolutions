class InfinitePlane
  def initialize(x, y)
    @x = x
    @y = y
  end

  def move(direction, step)
    @x += step if direction == '>'
    @x -= step if direction == '<'
    @y += step if direction == 'v'
    @y -= step if direction == '^'
    step = -step if direction == '~'
    step
  end

  def move_to_directions(directions)
    step = 1
    directions.chars.each { |direction| step = move direction, step }
  end

  def to_array
    [@x, @y].to_s
  end

  def to_s
    "(#{@x}, #{@y})"
  end
end

plane = InfinitePlane.new 0, 0
plane.move_to_directions '>>><<<~>>>~^^^'
puts plane