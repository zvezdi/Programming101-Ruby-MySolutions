require 'minitest/autorun'

require_relative 'warmup'

class WarmupTest < Minitest::Test
  #------fact iterative------
	def test_fact_loop_with_zero
    assert_equal 1, fact(0)
  end

  def test_fact_loop_general_case
    assert_equal 120, fact(5)
  end

  #------fact recursive------
  def test_fact_recursive_zero
    assert_equal 1, fact(0)
  end

  def test_fact_recursive_general_case
    assert_equal 120, fact(5)
  end

  #------n-th lucas------
  def test_nth_lucas_zero
    assert_equal 2, nth_lucas(0)
  end

  def test_nth_lucas_one
    assert_equal 1, nth_lucas(1)
  end

  def test_nth_lucas_general_case
    assert_equal 18, nth_lucas(6)
  end

  #------first n lucas numbers------
  def test_first_lucas_zero
    assert_equal [], first_lucas(0)
  end

  def test_first_lucas_one
    assert_equal [2], first_lucas(1)
  end

  def test_first_lucas_more_than_one
    assert_equal [2, 1, 3, 4, 7], first_lucas(5)
  end

  #------count dijits in n------
  def test_count_digits_in_a_dijit
    assert_equal 1, count_digits(0)
  end

  def test_count_digits_general_case
    assert_equal 5, count_digits(12345)
  end

  def test_count_digits_in_a_negative_number
    assert_equal 2, count_digits(-37)
  end

  #------sum dijits in n------
  def test_sum_digits_in_a_dijit
    assert_equal 0, sum_digits(0)
  end

  def test_sum_digits_general_case
    assert_equal 15, sum_digits(12345)
  end

  #------factorial digits------
  def test_factorial_digits_of_a_dijit
    assert_equal 120, factorial_digits(5)
  end

  def test_factorial_digits_general_case
    assert_equal 153, factorial_digits(12345)
  end

  #------n-th fibonacci------
  def test_nth_fibonacci_zero
    assert_equal 0, nth_fibonacci(0)
  end

  def test_nth_fibonacci_one
    assert_equal 1, nth_fibonacci(1)
  end

  def test_nth_fibonacci_general_case
    assert_equal 8, nth_fibonacci(6)
  end

  #------fib_number------
  def test_fib_number_general_case
    assert_equal 11235813213455, fib_number(10)
  end

  #------palindrom?------
  def test_palindrome_on_number_true_case
    assert(palindrome?(10100101), "This was expected to be palindrome.")
  end

  def test_palindrome_on_number_false_case
    assert(!palindrome?(110121), "This was not expected to be palindrome.")
  end

  def test_palindrome_on_stirng_true_case
    assert palindrome?("azobi4amma4iboza"), "This was ecpectet to be a palindrome."
  end

  def test_palindrome_on_stirng_false_case
    assert !palindrome?("nesumpalendrom"), "This was not ecpectet to be a palindrome."
  end

  #------is a hack number?------
  def test_hack_true_case_1
    assert(hack?(1), "This was expected to be a hack number.")
  end

  def test_hack_true_case_2
    assert(hack?(21), "This was expected to be a hack number.")
  end

  def test_hack_true_case_3
    assert(hack?(8191), "This was expected to be a hack number.")
  end

  def test_hack_false_case_1
    assert(!hack?(17), "This was not expected to be a hack number.")
  end

  def test_hack_false_case_2
    assert(!hack?(42), "This was not expected to be a hack number.")
  end

  #------find next hack number------
  def test_next_hack_1
    assert_equal 1, next_hack(0)
  end

  def test_next_hack_2
    assert_equal 21, next_hack(10)
  end

  def test_hext_hack_3
    assert_equal 8191, next_hack(8031)
  end

  #------is a letter vowel?------
  def test_vowel_small_letter_true_case
    assert(vowel?('a'), "This was expected to be a vowel.")
  end

  def test_vowel_capital_letter_true_case
    assert(vowel?('U'), "This was expected to be a vowel.")
  end

  def test_vowel_false_case
    assert(!vowel?('b'), "This was not expected to be a vowel.")
  end

  #------count vowels------
  def test_count_vowels_no_vowels
    assert_equal 0, count_vowels("grrrrgh!")
  end

  def test_count_vowels
    assert_equal 22, count_vowels("Github is the second best thing that happend to programmers, after the keyboard!")
  end

  def test_count_vowels_alphabet
    assert_equal 6, count_vowels("AbcdefgHIjkLmnopQRSTUvwxyz.")
  end

  #------count consonants------
  def test_count_consonants
    assert_equal 44, count_consonants("Github is the second best thing that happend to programmers, after the keyboard!")
  end

  #------palindrome score------
  def test_p_score_base_case
    assert_equal 1, p_score(121)
  end

  def test_p_score_general_case
    assert_equal 6, p_score(198)
  end

  #------prime?------
  def test_if_0_is_prime
    assert !prime?(0), "This was not expected to be prime."
  end

  def test_if_1_is_prime
    assert !prime?(1), "This was not expected to be prime."
  end

  def test_prime_true_case
    assert prime?(13), "This was expected to be prime."
  end

  def test_prime_false_case
    assert !prime?(42), "This was not expected to be prime."
  end

  #------first n primes------
  def test_first_primes_zero
    assert_equal [], first_primes(0)
  end

  def test_first_primes_general_case
    assert_equal [2, 3, 5, 7, 11, 13, 17, 19, 23, 29], first_primes(10)
  end

  #-------sum of numbers in a string------
  def test_sum_of_numbers_in_string_without_dijits
    assert_equal 0, sum_of_numbers_in_string("abcd")
  end

  def test_sum_of_numbers_in_string_with_numbers
    assert_equal 56, sum_of_numbers_in_string("1abc33xyz22")
  end

  def test_sum_of_numbers_in_string_with_only_numbers
    assert_equal 1342, sum_of_numbers_in_string("1342")
  end

  #------anagrams------
  def test_anagram_true_case
    assert anagrams?("army", "mary"), "This was expected to be an anagram."
  end

  def test_anagram_false_case
    assert !anagrams?("peper", "salt"), "This was not expected to be an anagram."
  end

  #------test zero insert
  def test_zero_insert_no_changes
    assert_equal 1, zero_insert(1)
  end

  def test_zero_insert_between_equal_dijits
    assert_equal 505050505, zero_insert(55555)
  end

  def test_zero_insert_between_summing_up_to_10
    assert_equal 604307, zero_insert(6437)
  end

  def test_zero_insert_both
    assert_equal 101604505, zero_insert(116455)
  end
end