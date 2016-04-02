#factorial using a simple loop
def fact(n)
  (1..n).reduce(1, :*)
end

#factorial using recursion
def fact(n)
  return 1 if n == 0
  n * fact(n - 1)
end

#lucas series - n-th lucas number
def nth_lucas(n)
  a, b = 2, 1 

  2.upto(n) do
    a, b = b, a + b
  end

  b = 2 if n == 0

  b
end

#lucas series - list of first n numbers
def first_lucas(n)
  (0..n - 1).collect { |num| nth_lucas num }
end

#number of dijits in a number
def count_digits(n)
  return 1 if (-9..9).cover? n #n >= -9 and n <= 9
  1 + count_digits(n / 10)
end

#sum dijits of a number
def sum_digits(n)
  return n  if n <= 9
  n % 10 + sum_digits(n / 10)
end

#we have 145, we need to calculate 1! + 4! + 5!
def factorial_digits(n)
  return fact(n) if n <= 9
  fact(n % 10) + factorial_digits(n / 10)
end

def nth_fibonacci(n)
  case n
  when 0 then 0
  when 1 then 1
  else nth_fibonacci(n - 1) + nth_fibonacci(n - 2)
  end
end

#takes an integer n and returns a number, which is formed by concatenating
#the first n Fibonacci numbers
def fib_number(n)
  fib_array = (1..n).collect { |num| nth_fibonacci num }
  fib_array.join().to_i
end

#hack number -  represented in binary, is a palindrome
#which has odd number of 1's in it

def palindrome?(obj)
  obj.to_s == obj.to_s.reverse
end

#checks if n is a hack number
def hack?(n)
  binary_n = n.to_s(2).to_i
  palindrome? binary_n and sum_digits(binary_n).odd?
end

#returns the next hack number, that is bigger than n
def next_hack(n)
  return n.next if hack? n.next
  next_hack n.next
end

def vowel?(letter)
  letter.downcase!
  "aeiouy".chars.any? { |vowel| vowel == letter }
end

#vowels in a string
def count_vowels(str)
  str.chars.map do |letter|
    if vowel? letter
      letter = 1
    else
      letter = 0
    end
  end.reduce(0, :+)
end

def consonant?(letter)
  letter.downcase!
  "bcdfghjklmnpqrstvwxz".chars.any? { |consonant| consonant == letter }
end

#consonants in a string
def count_consonants(str)
  str.chars.map do |letter|
    if consonant? letter
      letter = 1
    else
      letter = 0
    end
  end.reduce(0, :+)
end

#palindrome Score
def p_score(n)
  return 1 if palindrome? n
  1 + p_score(n + n.to_s.reverse.to_i)
end

def prime?(n)
  return false if n == 0 || n == 1
  (2...n-1).none? { |divisor| n % divisor == 0 }
end

def first_primes(n)
  return [] if n == 0

  primes = [2]
  checked_to = 1

  until primes.size >= n
    pending = Array.new(10) { |index| index * 2 + checked_to  }
    pending.delete(1)
    checked_to = pending.last + 2 # the next odd number

    #delete the numbers divisible by a prime we have
    #found on a previous iteration
    primes.each do |prime|
      pending.each do |num|
        pending.delete(num) if num % prime == 0
      end
    end

    #find the next prime and delete all devisible by it numbers in the array pending
    until pending.empty?
      prime = pending.first
      primes << prime
      pending.each { |num| pending.delete(num) if num % prime == 0 }
    end
  end

  primes[0..n-1]
end

#sum all numbers in a string
def sum_of_numbers_in_string(str)
  str.scan(/\d+/).map { |chars| chars.to_i }.reduce(0, :+)
end

def anagrams?(a, b)
  a.chars.sort == b.chars.sort
end

def balanced?(n)
  return true if n <= 9
  digits = n.to_s.chars.map { |char| char.to_i }
  size = digits.size
  case
  when size.even?
    digits[0...size/2].reduce(0, :+) == digits[size/2...size].reduce(0, :+)
  when size.odd?
    digits[0...size/2].reduce(0, :+) == digits[size/2 + 1...size].reduce(0, :+)
  end
end 

def zero_insert(n)
  digits = n.to_s.chars.map { |char| char.to_i }
  result = [digits[0]]

  (1...digits.size).each do |index|
    result << 0 if digits[index] == digits[index - 1] or
                   ( digits[index] + digits[index - 1] ) % 10 == 0
    result << digits[index]
  end

  result.join.to_i
end
