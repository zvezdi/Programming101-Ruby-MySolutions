class Monom
  include Comparable

  def self.parse(monom)
    if monom.chr =~ /\d/
      coeff = monom.to_i
      tmp = monom[coeff.to_s.length..monom.length].split '^'
    else
      coeff = 1
      tmp = monom.split '^'
    end

    case tmp.size
    when 0
      variable = ''
      exponent = 0
    when 1
      variable = tmp[0].strip
      exponent = 1
    when 2
      variable = tmp[0].strip
      exponent = tmp[1].to_i
    end
    
    Monom.new coeff, variable, exponent
  end

  attr_reader :coeff, :variable, :exponent

  def initialize(coeff, variable, exponent)
    @coeff = coeff
    @variable = variable
    @exponent = exponent
  end

  def derive
    if constant?
      Monom.new 0, '', 0
    elsif degree == 1
      Monom.new @coeff, '', 0
    else
      Monom.new @coeff * @exponent, @variable, @exponent - 1
    end
  end

  def to_s
    if constant? 
      @coeff.to_s
    elsif degree == 1
      @coeff.to_s + @variable
    else
      @coeff.to_s + @variable + '^' + @exponent.to_s
    end
  end

  def constant?
    @exponent == 0
  end

  def degree
    @exponent
  end

  def +(other)
    if @exponent == other.exponent and @variable == other.variable
      Monom.new(@coeff + other.coeff, @variable, @exponent)
    else
      # not defined trow some kind of exeption?
    end
  end

  def <=>(other)
    case
    when @exponent == other.exponent
      return 0 if @coeff == other.coeff
      return 1 if @coeff > other.coeff
      return -1 if @coeff < other.coeff
    when @exponent > other.exponent
      return 1
    when @exponent < other.exponent
      return -1
    end
  end
end

class Polynom
  def self.parse(polynom)
    monoms = []

    polynom.split('+').each do |monom|
      monoms << Monom.parse(monom.strip)
    end

    Polynom.new monoms
  end

  def initialize(monoms)
    @monoms = monoms
  end
  
  def derive
    derived_polynom = []
    @monoms.each do |monom|
      derived_polynom << monom.derive
    end
    
    zero = Monom.new(0,'',0)
    derived_polynom.delete(zero)
    derived_polynom << zero if derived_polynom.size == 0

    Polynom.new derived_polynom
  end

  def normal_form
    simplyfy.sort  
  end

  def to_s
    @monoms.join ' + '
  end

  protected

  def sort
    Polynom.new @monoms.sort.reverse
  end

  def simplyfy
    hash = {} # need better name for hash
    @monoms.each do |monom|
      if hash.key? monom.degree
        hash[monom.degree] += monom
      else
        hash[monom.degree] = monom
      end
    end
    
    Polynom.new hash.values
  end
end

module Problem
  def self.find_derivative
    polynom = Polynom.parse ARGV[0]
    puts "The derivative of f(x) = #{polynom.normal_form} is:"
    puts "f\'(x) = #{polynom.derive.normal_form}"
  end
end

Problem.find_derivative