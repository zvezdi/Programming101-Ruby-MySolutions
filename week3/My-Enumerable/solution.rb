# Implementation of our own Enumerable class
module MyEnumerable
  def map
    Array.new.tap do |array|
      each do |element|
        value = yield element
        array << value
      end
    end
  end

  def filter
    Array.new.tap do |array|
      each { |element| array << element if yield element }
    end
  end

  def reject
    Array.new.tap do |array|
      each { |element| array << element unless yield element }
    end
  end

  def reduce(initial = nil)
    skip_first = false
    if initial.nil?
      initial = first
      skip_first = true
    end

    each do |element|
      if skip_first
        skip_first = false
        next
      end

      initial = yield initial, element
    end

    initial
  end

  def any?
    each { |element| return true if yield element }

    false
  end

  def all?
    each { |element| return false unless yield element }

    true
  end

  def include?(element)
    each do |el|
      return true if el == element
    end

    false
  end

  def count(element = nil)
    result = 0
    case
    when element
      each { |el| result += 1 if el == element }
    when block_given?
      each { |el| result += 1 if yield el }
    else
      each { result += 1 }
    end

    result
  end

  def size
    map { 1 }.reduce(0) { |acc, x| acc + x }
  end

  def min
    min = first
    each { |el| min = el if el < min }

    min
  end

  def first
    each { |element| return element }
  end

  def min_by
    return each unless block_given?
    min_value, min_element = yield first, first
    each do |element|
      if (yield element) < min_value
        min_value, min_element = (yield element), element
      end
    end

    min_element
  end

  def max
    max = first
    each { |el| max = el if el > max }

    max
  end

  def max_by
    return each unless block_given?
    max_value, max_element = yield first, first
    each do |element|
      if (yield element) > max_value
        max_value, max_element = (yield element), element
      end
    end

    max_element
  end

  def take(n)
    Array.new.tap do |first_n|
      each { |el| first_n << el if first_n.size < n }
    end
  end

  def take_while
    Array.new.tap do |result|
      each do |el|
        break unless yield el
        result << el
      end
    end
  end

  def drop(n = 1)
    Array.new.tap do |result|
      i = 1
      each do |el|
        if i <= n
          i += 1
          next
        end

        result << el
      end
    end
  end

  def drop_while
    i = 0
    each do |el|
      if yield el
        i += 1
      else
        break
      end
    end
    drop i
  end
end
