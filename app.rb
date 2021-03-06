require 'sinatra'
require_relative 'hangman.rb'

enable :sessions

get '/' do

	erb :welcome

end

post '/players' do

	session[:p1] = params[:player1]
	session[:p2] = params[:player2]

	erb :get_word, :locals => {p1: session[:p1], p2: session[:p2]}

end

post '/pregame' do
	session[:guess_word] = params[:guess_word]
	session[:hangman] = Hangman.new(session[:guess_word])
	if session[:hangman].valid_input? == false
		redirect '/invalid_word'
	end

	session[:length] = session[:hangman].correct_letters.count

	redirect '/main_game'

end

get '/invalid_word' do

	erb :invalid

end

get '/main_game' do
	session[:correct_letters] = session[:hangman].correct_letters.join
	session[:wrong] = session[:hangman].wrong_count

	erb :main_game, :locals => {p1: session[:p1], p2: session[:p2], guess_word: session[:guess_word], correct: session[:correct_letters], length: session[:length], wrong: session[:wrong]}

end

post '/make_guess' do
	session[:letter] = params[:letter]
	session[:hangman].guess_letter(session[:letter])

	if session[:hangman].wrong_count == 6

		message = 'Oh no, you lost. :('
		lose = true

		erb :hm_game_over, :locals => {lose: lose, message: message, word: session[:guess_word]}

	elsif session[:hangman].correct_letters.include?('_ ')

		redirect '/main_game'

	else

		message = 'Congrats! You won!'
		lose = false

		erb :hm_game_over, :locals => {lose: lose, message: message, word: session[:guess_word]}

	end

end