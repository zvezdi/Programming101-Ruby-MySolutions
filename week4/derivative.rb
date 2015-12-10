#PolynomDerivative
#Input - string 3*x^3 + 2*x^4 + ....
#Parse string 
#split string by + ---> array
#for each member of array ---derive it ---> member of result ---> result array


#MonomDerivative
#Input - string 3*x^3
#parse string ---> instance variables : @coefficient, @variable, @exponent
#input ---calculate derivative---> derivative

class Monom

  def self.parse(monom) #fix it !!!!!!
    coeff = monom.split('*')[0].strip.to_i
    variable = monom.split('*')[1].strip.split('^')[0].strip
    exponent = monom.split('*')[1].strip.split('^')[1].strip.to_i
    
    Monom.new(coeff, variable, exponent)
  end

  attr_accessor :coeff, :variable, :exponent

  def initialize(coeff, variable, exponent)
    @coeff = coeff
    @variable = variable
    @exponent = exponent
  end

  def derive
    Monom.new(@coeff * @exponent, @variable, @exponent - 1)
  end

  def to_s
    @coeff.to_s + '*' + @variable + '^' + @exponent.to_s
  end

end

class Polynom

  def self.parse(polynom)
    monoms = []

    polynom.split('+').each do |monom|
      monoms << Monom.parse(monom.strip)
    end

    Polynom.new(monoms)
  end

  def initialize(monoms)
    @monoms = monoms
  end
  
  def derive
    derived_polynom = []
    @monoms.each do |monom|
      derived_polynom << monom.derive
    end

    Polynom.new(derived_polynom)
  end

  def to_s
    @monoms.join ' + '
  end

end

m = Polynom.parse("2*x^3 + 4*x^7")
puts m.derive