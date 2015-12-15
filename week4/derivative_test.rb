require 'minitest/autorun'

require_relative 'derivative'

class DerivativeTest < MiniTest::Test
#----------test Monom class------------
#-------------test parse---------------
  def test_monom_parse_standart_case
    monom = Monom.parse '2x^4'

    assert_equal Monom.new(2, 'x', 4), monom
  end

  def test_monom_parse_constant
    monom = Monom.parse '13'

    assert_equal Monom.new(13, '', 0), monom
  end

  def test_monom_parse_partial
    monom = Monom.parse 'x^5'

    assert_equal Monom.new(1, 'x', 5), monom
  end

  def test_monom_parse_x
    monom = Monom.parse 'x'

    assert_equal Monom.new(1, 'x', 1), monom
  end
#--------------test derive---------------
  def test_monom_derive_standart_case
    monom = Monom.new 3, 'x', 2

    assert_equal Monom.new(6, 'x', 1), monom.derive
  end

  def test_monom_derive_constant
    monom = Monom.new 13, '', 0

    assert_equal Monom.new(0, '', 0), monom.derive
  end

  def test_monom_derive_partial
    monom = Monom.new 0, 'x', 5

    assert_equal Monom.new(0, 'x', 4), monom.derive
  end
#-----------test + operator-------------
  def test_add_operator_equal_degree
    monom1 = Monom.new 13, 'x', 2
    monom2 = Monom.new 29, 'x', 2

    assert_equal Monom.new(42, 'x', 2), monom1 + monom2
  end

  def test_add_operator_different_degree
    monom1 = Monom.new 13, 'x', 3
    monom2 = Monom.new 29, 'x', 2

    assert_equal nil, monom1 + monom2
  end
#-------test comparable operator--------
  def test_comparable_operator_smaller
    monom1 = Monom.new 13, 'x', 2
    monom2 = Monom.new 29, 'x', 2

    assert_equal -1, monom1 <=> monom2
  end

  def test_comparable_operator_equal
    monom1 = Monom.new 13, 'x', 2
    monom2 = Monom.new 13, 'x', 2

    assert_equal 0, monom1 <=> monom2
  end

  def test_comparable_operator_larger
    monom1 = Monom.new 13, 'x', 3
    monom2 = Monom.new 13, 'x', 2

    assert_equal 1, monom1 <=> monom2
  end
#----------test Polynom class-----------
#-------------test parse----------------
  def test_polynom_parse_standart_case
    polynom = Polynom.parse '3x^2 + 7x + 13'

    monom1 = Monom.new(3, 'x', 2)
    monom2 = Monom.new(7, 'x', 1)
    monom3 = Monom.new(13, '', 0)
    
    assert_equal Polynom.new([monom1, monom2, monom3]), polynom
  end

  def test_polynom_parse_zero
    polynom = Polynom.parse '0'

    monom = Monom.new(0, '', 0)
    
    assert_equal Polynom.new([monom]), polynom
  end
#---------------derive-----------------


end