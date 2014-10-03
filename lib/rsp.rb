require 'sinatra/base'
require_relative 'game'
require_relative 'player'

class RSP < Sinatra::Base

	set :views, Proc.new { File.join(root, '..',  "views") }
	enable  :sessions

	GAME = Game.new

  	get '/' do
  		erb :index
	end

	post '/' do
		session[:name] = params[:name]
		redirect '/' if(session[:name] == '')

		player = Player.new
		redirect('/play')
	end

	get '/play' do
		erb :play
	end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
