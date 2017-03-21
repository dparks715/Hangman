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

end