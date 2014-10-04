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

		@is_winner = nil
		if @playerOption == '' || @playerOption == nil 
			set_message_and_redirect('Please select an option')
		end
		
		@computerOption = GAME.generate_answer
		
		if @playerOption.to_sym == @computerOption
			set_message_and_redirect("It's a tie!") 
		end

		session[:error] = ''
		@is_winner = GAME.is_player_the_winner?(@playerOption, @computerOption)

		@name = session[:name]
		erb :play
	end

	def set_message_and_redirect(msg)
		session[:error] = msg
		redirect('/play') 
	end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
