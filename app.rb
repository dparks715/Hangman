require 'sinatra'
require_relative 'hangman.rb'

enable :sessions

get '/' do

	erb :welcome

end