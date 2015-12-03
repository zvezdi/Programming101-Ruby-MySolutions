def numbers_to_message(pressedSequence)
  keyboard = {
    -1 => [''],
    0 => [' '],
    1 => [''],
    2 => ['a', 'b', 'c'],
    3 => ['d', 'e', 'f'],
    4 => ['g', 'h', 'i'],
    5 => ['j', 'k', 'l'],
    6 => ['m', 'n', 'o'],
    7 => ['p', 'q', 'r', 's'],
    8 => ['t', 'u', 'v'],
    9 => ['w', 'x', 'y', 'z']
  }
  output = ""
  letter_index = 0
  capital = false

  pressedSequence.each_with_index do |number, index|
    case pressedSequence[index]
    when -1
      letter_index = 0
    when 1
      capital = true
    when pressedSequence[index + 1]
      letter_index += 1
    else
      letter_index %= keyboard[number].length
      letter = keyboard[number][letter_index]
      letter.capitalize! if capital
      output << letter
      letter_index = 0
      capital = false
    end     
  end

  output
end

#puts numbers_to_message [1, 4, 4, 4, 8, 8, 8, 6, 6, 6, 0, 3, 3, 0, 1, 7, 7, 7, 7, 7, 2, 6, 6, 3, 2]

def message_to_numbers(message) # not working need to change the hash or find smarter solution
  keyboard = {
    -1 => [''],
    0 => [' '],
    1 => [''],
    2 => ['a', 'b', 'c'],
    3 => ['d', 'e', 'f'],
    4 => ['g', 'h', 'i'],
    5 => ['j', 'k', 'l'],
    6 => ['m', 'n', 'o'],
    7 => ['p', 'q', 'r', 's'],
    8 => ['t', 'u', 'v'],
    9 => ['w', 'x', 'y', 'z']
  }

  coresponding_sequence = []
  p message.chars
  message.chars.each do |char|
    number = keyboard.key(char)
    p keyboard.key('')
    #keyboard[number].index(char).times {coresponding_sequence << number}
  end

  coresponding_sequence
end

#Spam and eggs
def prepare_meal(number)
  n = 0
  (1..number).each do |power|
   n = power if number % 3**power == 0
  end

  meal = []
  n.times { meal << 'spam' }

  if number % 5 == 0
    case meal.length
    when 0
      meal << 'eggs'
    else 
      meal << 'and eggs'
    end 
  end

meal.join ' '
end

#Reduse file path
def reduse_file_path(path)
  path_array = path.squeeze('/').split '/'
  (0...path_array.length).each do |index|
    path_array.delete_at index if path_array[index + 1] == '..' 
  end

path_array.join('/').delete('.').squeeze('/').chomp('/')
end

#Word from a^nb^n
def is_an_bn(word)
  word.length % 2 == 0 and
  word[0...word.length / 2].chars.all? { |letter| letter == 'a'} and
  word[word.length / 2...word.length].chars.all? { |letter| letter == 'b'}
end

#Credit card validation
def is_credit_card_valid(number)
  number = number.to_s.chars.map(&:to_i)
  (0...number.length).each do |index|
    number[index] *= 2 if index % 2 == 1
  end

  number.reduce(:+) % 10 == 0 and number.length.odd?
end

#Goldbach Conjecture
def goldbach(n)
  require 'prime'
  primes = []
  Prime.each(n) { |prime| primes << prime}

  Array.new.tap do |result|
    primes.each do |prime| 
      if primes.include?(n - prime)
        result << [prime, n - prime] unless result.include? [n - prime, prime]
      end
    end
  end
end

#Magic square
def magic_square(matrix)
  sums = []
  (0...matrix.length).each { |row| sums << matrix[row] }
  (0...matrix[0].length).each do |column|
    sums << Array.new.tap do |horizontal|
             (0...matrix.length).each do |row|
               horizontal << matrix[row][column]
               end 
            end
  end
  sums << Array.new.tap do |main_diagolal|
            (0...matrix.length).each do |index|
              main_diagolal << matrix[index][index]
            end
          end
  sums << Array.new.tap do |back_diagolal|
            (0...matrix.length).each do |index|
              back_diagolal << matrix[index][(matrix.length - 1) - index]
            end
          end
  sums.each_with_index { |sum, index| sums[index] = sum.reduce(:+)}
  sums.all? { |sum| sum == sums[0]}
end