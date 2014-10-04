require 'sinatra/base'
require_relative 'game'
require_relative 'player'

class RSP < Sinatra::Base

	set :views, Proc.new { File.join(root, '..',  "views") }
	enable  :sessions

	GAME = Game.new

  	get '/' do
  		session[:error] = ''
  		session[:error] = 'We have allready two players playing...' if GAME.has_two_players?
  		erb :index
	end

	post '/' do
		session[:name] = params[:name]
		redirect '/' if session[:name] == ''

		add_player unless GAME.has_two_players?

		redirect '/play' if GAME.has_two_players?

    	redirect ('/welcome')
	end

	get '/welcome' do
		redirect('/play') if GAME.has_two_players?
		@name = session[:name]
		erb :welcome
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

	def add_player
		player = Player.new
		player.name = session[:name]
		GAME.add_player(player)
		GAME.has_two_players? ? session[:current_player] = :player2 :  session[:current_player] = :player1
	end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
