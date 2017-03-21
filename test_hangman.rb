require 'minitest/autorun'
require_relative 'hangman.rb'

class TestHangman < Minitest::Test

	def test_container_is_array
		hangman_object = Hangman.new('hello')
		results = hangman_object.correct_letters
		assert_equal(Array, results.class)	
	end

	def test_array_length_5
		hangman_object = Hangman.new('hello')
		results = hangman_object.correct_letters
		assert_equal(5, results.length)	
	end

	def test_array_elements
		hangman_object = Hangman.new('hangman')
		results = hangman_object.correct_letters
		assert_equal(['_','_','_','_','_','_','_'], results)	
	end

	def test_array_correct_guess_A
		hangman_object = Hangman.new('hangman')
		hangman_object.guess_letter('A')
		results = hangman_object.correct_letters
		assert_equal(['_','A','_','_','_','A','_'], results)	
	end

	def test_array_incorrect_guess_J_wrong_count_1
		hangman_object = Hangman.new('hangman')
		hangman_object.guess_letter('J')
		results = hangman_object.wrong_count
		assert_equal(1, results)
	end

	def test_array_correct_guess_BBBBBB
		hangman_object = Hangman.new('bbbbbb')
		hangman_object.guess_letter('b')
		results = hangman_object.correct_letters
		assert_equal(['B','B','B','B','B','B'], results)	
	end

	def test_invalid_word_input_false
		hangman_object = Hangman.new('Hello1')
		results = hangman_object.valid_input?
		assert_equal(false, results)	
	end

	def test_valid_word_input_true
		hangman_object = Hangman.new('HeLlO')
		results = hangman_object.valid_input?
		assert_equal(true, results)	
	end

	def test_invalid_symbols_false
		hangman_object = Hangman.new('Hangman%')
		results = hangman_object.valid_input?
		assert_equal(false, results)	
	end

end