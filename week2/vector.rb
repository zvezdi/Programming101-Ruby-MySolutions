class Vector
  include Math

  def initialize(*components)
    if components[0].is_a? Array
      @components = components[0]
    else
      @components = components
    end
  end

  def dimension
    @components.length
  end

  def length
    sqrt @components.inject(0) { |sum, el| sum + el * el }
  end

  def normalize
    (0...dimension).each { |index| self[index] /= length }

    self
  end

  def [](index)
    @components[index]
  end

  def []=(index, value)
    @components[index] = value
  end

  def components
    @components
  end

  def ==(other)
    return false unless @components == other.components
    (0...dimension).each do |index|
      return false unless @components[index] == other.components[index]
    end

    true
  end

  def +(vector_of_same_dimension_or_scalar)
    v = Vector.new
    
    (0...dimension).each do |index|
      if vector_of_same_dimension_or_scalar.is_a? Numeric
        v[index] = self[index] + vector_of_same_dimension_or_scalar
      elsif dimension == vector_of_same_dimension_or_scalar.dimension
        v[index] = self[index] + vector_of_same_dimension_or_scalar[index]
      else
        #different dimention non defined operation
        v = nil
      end
    end

    v
  end

  def -(vector_of_same_dimension_or_scalar)
    v = Vector.new
    
    (0...dimension).each do |index|
      if vector_of_same_dimension_or_scalar.is_a? Numeric
        v[index] = self[index] - vector_of_same_dimension_or_scalar
      elsif dimension == vector_of_same_dimension_or_scalar.dimension
        v[index] = self[index] - vector_of_same_dimension_or_scalar[index]
      else
        #different dimention non defined operation
        v = nil
      end
    end

    v
  end

  def *(scalar)
    v = Vector.new
    (0...dimension).each { |index| v[index] = self[index] * scalar }

    v
  end

  def /(scalar)
    v = Vector.new
    (0...dimension).each { |index| v[index] = self[index] / scalar.to_f }

    v
  end

  def dot(vector_of_same_dimension_or_scalar)
    return nil unless dimension == vector_of_same_dimension_or_scalar.dimension

    (0...dimension).inject(0) do |sum, index|
      sum + self[index] * vector_of_same_dimension_or_scalar[index]
    end
  end

  def to_s
    result = '('
    @components.each { |el| result << "#{el}, "}
    result.strip!
    result[result.length - 1] = ')'

    result
  end
end
