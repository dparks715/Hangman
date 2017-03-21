require 'minitest/autorun'
require_relative 'hangman.rb'

class TestHangman < Minitest::Test

	def test_container_is_array
		results = correct_letters('hello')
		assert_equal(Array, results.class)
		
	end

end