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

post '/game' do
	session[:guess_word] = params[:guess_word]
	session[:hangman] = Hangman.new(session[:guess_word])
	if session[:hangman].valid_input? == false
		redirect '/invalid_word'
	end


	erb :main_game, :locals => {p1: session[:p1], p2: session[:p2], guess_word: session[:guess_word]}

end

get '/invalid_word' do

	erb :invalid

end