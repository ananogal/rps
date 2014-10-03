require 'sinatra/base'
require_relative 'game'

class RSP < Sinatra::Base

	set :views, Proc.new { File.join(root, '..',  "views") }
	enable  :sessions

	GAME = Game.new

  	get '/' do
  		erb :index
	end

	post '/' do
		session[:name] = params[:name]
		redirect '/' if session[:name] == ''

		redirect('/play')
	end

	get '/play' do
		@name = session[:name]
		@is_winner = nil
		erb :play
	end

	post '/play' do 
		@playerOption = params[:rps]
		redirect('/play') if @playerOption == '' || @playerOption == nil
		
		@name = session[:name]
		@computerOption = ([:rock, :paper, :scissors] - [@playerOption.to_sym]).sample
		@is_winner = GAME.is_player_the_winner?(@playerOption.to_sym, @computerOption.to_sym)
		erb :play
	end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
