#Factorial
def factIterative(n)
	result = 1
	while n > 0
		result = result * n
		n = n - 1
	end

	result
end

def factRecursive(n)
	return 1 if n == 1
	n * factRecursive(n - 1)
end

def factRecursive2(n) #is this more ruby style?
	if n == 1
		1
	else
		n * factRecursive2(n - 1)
	end
end

#Lucas series

def nth_lucas(n)
	return 2 if n == 0
	return 1 if n == 1
	nth_lucas(n - 1) + nth_lucas(n - 2)
end

def first_lucas(n) # returns a list of the first n Lucas numbers
	list_of_lucas = [2, 1]
	index = 2

	while index < n
		list_of_lucas << list_of_lucas[-1] + list_of_lucas[-2]
		index = index + 1
	end

	list_of_lucas
end

#Working with digits
def countDigits(n)
	return 1 if n < 9
	1 + countDigits(n / 10)
end

def countDigitsIter(n)
	count = 0
	while n > 0
		n = n / 10
		count = count + 1
	end

	count
end

def sumDigits(n)
	return n if n <= 9
	n % 10 + sumDigits(n / 10)
end

def sumDigitsIter(n)
	sum = 0
	while n > 0 
		sum = sum + n % 10
		n = n / 10
	end

	sum
end

def factorialDigits(n)
	return factIterative(n) if n < 9
	factIterative(n % 10) + factorialDigits(n / 10)
end

#Fibonacci number
def fibonacci(n)
	return 0 if n == 0
	return 1 if n == 1
	fibonacci(n - 2) + fibonacci(n - 1)
end

def fib_number(n)
	number = 0
	index = 1
	while index <= n
		fib_n = fibonacci(index)
		number = number * 10 ** countDigits(fib_n) + fib_n
		index = index + 1
	end

	number
end

#Hack numbers
def toBinary(n)
	bin_number = []
	while n > 0 
		bin_number << n % 2
		n = n / 2
	end

	bin_number.reverse.join.to_i
end

def palendrom?(n)
	n.to_s == n.to_s.reverse
end

def number_of_ones2(n)
	return 0 if n <= 9 && n != 1
	return 1 if n <= 9 && n == 1
	1 + number_of_ones(n / 10) if n % 10 == 1
	number_of_ones(n / 10) if n % 10 != 1
end

def number_of_ones(n)
	count = 0
	while n > 0
		count = count + 1 if n % 2 == 1
		n = n / 10
	end

	count
end

def odd_number_of_ones?(n)
	number_of_ones(n) % 2 == 1
end

def hack_number?(n)
	bin_n = toBinary(n)
	palendrom?(bin_n) && odd_number_of_ones?(bin_n)
end

def next_hack_number(n)
	until hack_number?(n + 1)
		n = n + 1		
	end
	n + 1
end

#Vowels in a string
def count_vowels(string)
	count = 0
	string.downcase.each_char { |char|
		count = count + 1 if "aeiouy".include? char }

	count
end

def consonants(string)
	count = 0
	string.downcase.each_char { |char|
		count = count + 1 if "bcdfghjklmnpqrstvwxz".include? char }

	count
end

#Palidrom score
def palindrom?(string)
	string == string.reverse
end

def p_score(n)
	if palendrom? n
		1
	else
		1 + p_score(n + n.to_s.reverse.to_i)
	end
end

#Integer palendroms
def is_int_palindrome?(n)
	n.to_s == n.to_s.reverse
end

def largest_palindrome(n)
	until is_int_palindrome? n
		n = n - 1
	end

	n
end


#Prime numbers
def is_prime?(n)
	(2...n).each { |i| return false if n % i == 0 }
	true
end

def list_first_primes(n)
	list_of_primes = []
	(1..n).each { |num| list_of_primes << num if is_prime? num}

	list_of_primes
end

def sieve_of_eratosthenes(n)
	result = []
	first_n = (1..n).to_a
	first_n.each { |num| 
		result << num
		first_n.reject! { |dividable| dividable % 2 == 0 }
	}
	result
end

#Sum all numbers in a given string
def sum_of_numbers_in_string(str) # needs better regexpr
	n = 0
	str.split(/[a-z, A-Z, ., !]/).each {|s| n = n + s.to_i}
	
	n
end

def sum_of_numebrs_in_string2(str)
	str.reverse!
	factor = 1
	sum = 0
	str.chars.each { |char|
		if (1..9).include? char.to_i
			sum += factor * char.to_i
			factor *= 10
		else
			factor = 1
		end
	}
	sum
end

def anagrams?(a, b)
	a.chars.sort == b.chars.sort
end

def has_anagram_of?(a,b)
	b = b.chars.sort.to_s
	a = a.chars.sort.to_s

	b.chars.each { |char| 
		a = a[1..-1] if a.start_with?(char) }

	a.length == 0
end

#Is number balanced
def is_number_balansed?(n)
	first_part = n.to_s.chars.take(n.to_s.length / 2)
	second_part = n.to_s.chars.drop(n.to_s.length / 2 + n.to_s.length % 2)

	first_part = first_part.reduce { |sum, n| sum + n }.to_i
	second_part = second_part.reduce { |sum, n| sum + n }.to_i

	sumDigits(first_part) == sumDigits(second_part)
end

#Zero Insertion
def zero_insert(n)
	n = n.to_s
	result = n[0]
	(1...n.length).each { |index|
		previous = n[index - 1]
		current = n[index]
		if previous == current or (previous.to_i + current.to_i) % 10 == 0
			result << "0#{current}"
		else
			result << "#{current}"
		end
	}
	result.to_i
end