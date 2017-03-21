class Hangman

	attr_accessor :word

	def initialize(word)
		@word = word
	end

	#function to make a container array for guessed letters
	def correct_letters
		correct_letters = Array.new(word.length, '_')
	end

end

