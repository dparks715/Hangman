require 'sinatra'
require_relative 'hangman.rb'

enable :sessions

get '/' do

	erb :welcome

end

post '/players' do

	p1 = params[:player1]
	p2 = params[:player2]

	erb :get_word, :locals => {p1: p1, p2: p2}

end