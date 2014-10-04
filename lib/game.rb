class Game
	attr_reader :elements

	attr_accessor :player1, :player2

	def initialize 
		@winner = nil
		@rules = {}
		@rules = {:rock => :scissors, :paper =>:rock, :scissors => :paper}
		@elements = [:rock, :paper, :scissors]
	end 

	def is_player_the_winner?(player_opt, computer_opt)
	 	@rules[player_opt.to_sym] == computer_opt.to_sym
	end

	def generate_answer
		@elements.sample
	end

	def add_player(player)
		@player1 != nil ? @player2 = player : @player1 = player unless has_two_players?
	end

	def has_two_players?
		player1 != nil && player2 != nil
	end

end