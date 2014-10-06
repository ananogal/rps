require 'sinatra/base'
require_relative 'game'
require_relative 'player'

class RSP < Sinatra::Base

	set :views, Proc.new { File.join(root, '..',  "views") }
	enable  :sessions

	GAME = Game.new

  	get '/' do
  		session[:error] = ''
  		session[:error] = 'We have already two players playing...' if GAME.has_two_players?
  		erb :index
	end

	post '/' do
		session[:name] = params[:name]
		redirect '/' if session[:name] == ''

		add_player unless GAME.has_two_players?

    	redirect ('/welcome')
	end

	get '/welcome' do
		session[:current_player] == :player1  ? player = GAME.player1 : player = GAME.player2
 		redirect('/play') if GAME.has_two_players? && player == GAME.turn
		@name = session[:name]
		erb :welcome
	end

	get '/play' do
		@name = session[:name]
		@is_winner = nil
		@selected_option = session[:option]

		if GAME.can_declare_a_winner?
			player = select_current_player
			opponent = GAME.opponent(player)
			@player_option = player.option
			@opponent_option = opponent.option
			@is_winner = GAME.is_player_the_winner?(@player_option, @opponent_option)
		end
		erb :play
	end

	post '/play' do 
		session[:option] = params[:rps]
		@is_winner = nil
		
		player = select_current_player
		player.option = session[:option]
		opponent = GAME.opponent(player)
		
		GAME.switch_turns if opponent.option == nil 
		set_message_and_redirect('Waiting for your opponent to make a move') if opponent.option == nil 
		@player_option = player.option
		@opponent_option = opponent.option
		@is_winner = GAME.is_player_the_winner?(@player_option, @opponent_option) if GAME.can_declare_a_winner?

		@name = session[:name]

		erb :play
	end

	get '/play_again' do
		GAME.player1.option = nil
		GAME.player2.option = nil
		session[:option] = nil
		session[:message] = nil
		GAME.turn = session[:first_to_play] == :player1 ? GAME.player1 : GAME.player2
		redirect('/play')
	end

	def set_message_and_redirect(msg)
		session[:message] = msg
		redirect('/play') 
	end

	def add_player
		player = Player.new
		player.name = session[:name]
		GAME.add_player(player)
		GAME.has_two_players? ? session[:current_player] = :player2 :  session[:current_player] = :player1
		session[:first_to_play] = session[:current_player] if session[:first_to_play] == nil
	end

	def select_current_player
		session[:current_player] == :player1  ? player = GAME.player1 : player = GAME.player2
		player
	end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
