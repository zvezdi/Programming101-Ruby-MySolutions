#Transforming integer into a list of digits and vice versa
def number_to_digits(number)
  dijits = []
  number.to_s.each_char { |char| dijits << char.to_i }

  dijits
end

def digits_to_number(dijits)
  dijits.reduce { |number, dijit| number.to_s + dijit.to_s }.to_i
end

#Extreme elements in a list
def min(items)
  min_item = items[0]
  items.each { |item| min_item = item if item < min_item}

  min_item
end

def max(items)
  max_item = items[0]
  items.each { |item| max_item = item if item > max_item}

  max_item
end

def nth_min(n, items)
  (n - 1).times { 
    nth_min_el = min items
    items.delete(nth_min_el)
  }
  min items
end

def nth_max(n, items)
  (n - 1).times { 
    nth_max_el = max items
    items.delete(nth_max_el)
  }
  max items
end

#Grayscale Image Histogram
def grayscale_histogram(image)
  histogram = {}
  image.each { |row| 
    row.each { |number|
      if histogram.has_key? number
        histogram[number] += 1
      else
        histogram[number] = 1
      end
    }
  }

  [].tap do |hist|
    0.upto(255).each do |index|
      if histogram.key? index
        hist << histogram[index]
      else
        hist << 0
      end
    end
  end
end

#Maximal Scalar Product
def scalar_product(v1, v2)
  product = 0
  (0...v1.length).each { |index| product += v1[index] * v2[index] }

  product
end

def max_scalar_product(v1, v2)
  #it's enough to permutate only one of the vectors
  #because + is commutative operator
  max_product = 0
  v1.permutation.each { |v1_perm|
    product = scalar_product v1_perm, v2
    max_product = product if product > max_product
    }

  max_product
end  

#Max span
def span(numbers, number)
  number_encountered = false
  span, current_span = 0, 0

  numbers.each do |num|
    if num == number 
      if number_encountered
        current_span += 1
        span = current_span
      else
        number_encountered = true
        span, current_span = 1, 1
      end
    end

    current_span += 1 if number_encountered and num != number
  end

  span
end

def max_span(numbers)
  check_list = numbers.uniq
  max_span = 0

  check_list.each do |num|
    max_span = span(numbers, num) if span(numbers, num) > max_span
  end

  max_span
end

#Sum numbers in matrix
def sum_matrix(m)
  sum = 0
  m.each { |row|
    row.each { |element|
      sum += element
    }
  }

  sum
end

#Matrix bombing
def is_inside?(m, x, y)
  rows = m.length
  columns = m[0].length
  (0...rows).include? y and (0...columns).include? x
end

def set_bomb!(m, x, y) #changes m
  return m unless is_inside? m, x, y
  adj = [[x-1, y - 1], [x - 1, y], [x - 1, y + 1],
         [x, y - 1], [x, y + 1],
         [x + 1, y - 1], [x + 1, y], [x + 1, y + 1]]

  adj.each { |way|
    curr_x = way[0].to_i
    curr_y = way[1].to_i

    if is_inside? m, curr_x, curr_y
      if m[curr_x][curr_y] - m[x][y] < 0
        m[curr_x][curr_y] = 0
      else
        m[curr_x][curr_y] -= m[x][y]
      end
    end
  }

  m
end

def copy(array)
  new_array = []
  (0...array.length).each do |index|
    new_array[index] = array[index].dup
  end

  new_array
end

def matrix_bombing_plan(m) 
  plan = {}
  (0...m.length).each do |row|
    (0...m[0].length).each do |column|
      copy_m = copy m
      plan[[row, column]] = sum_matrix( set_bomb! copy_m, row, column)
    end
  end

  plan
end

#Group function
def group(array)
  result = [[]]

  array.each do |el|
    last_sub_array = result[result.length - 1]
    if last_sub_array.include? el
      last_sub_array << el
    elsif last_sub_array.empty?
      last_sub_array << el      
    else
      result << [el]
    end
  end

  result
end

#Longest subsequence of equal consecutive elements
def max_consecutive(items)
  longest_consecutive = 0
  curr_consecutive = 0

  (1...items.length).each do |index|
    if items[index - 1] == items[index]
      curr_consecutive += 1
      longest_consecutive = curr_consecutive if curr_consecutive > longest_consecutive
    else
      curr_consecutive = 1
    end
  end

  longest_consecutive
end
