require 'minitest/autorun'
require_relative 'hangman.rb'

class TestHangman < Minitest::Test

	def test_container_is_array
		results = correct_letters('hello')
		assert_equal(Array, results.class)	
	end

	def test_array_length_5
		results = correct_letters('hello')
		assert_equal(5, results.length)	
	end

	def test_array_elements
		results = correct_letters('hangman')
		assert_equal(['_','_','_','_','_','_','_'], results)	
	end

end