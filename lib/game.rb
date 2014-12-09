class Game
	attr_reader :elements

	attr_accessor :player1, :player2, :turn

	def initialize 
		@winner = nil
		@rules = {}
		@rules = {:rock => :scissors, :paper =>:rock, :scissors => :paper}
		@elements = [:rock, :paper, :scissors]
	end 

	def is_player_the_winner?(player_opt, opponent_opt)
	 	@rules[player_opt.to_sym] == opponent_opt.to_sym
	end

	def rules_result(player_opt, opponent_opt)
		return "tie" if player_opt == opponent_opt
		return is_player_the_winner?(player_opt, opponent_opt) ? "win" : "loose"
	end

	def generate_answer
		@elements.sample
	end

	def add_player(player)
		self.player1 != nil ? self.player2 = player : self.player1 = player unless has_two_players?
	end

	def has_two_players?
		self.player1 != nil && self.player2 != nil
	end

	def turn
		@turn ||= self.player1 
	end 

	def opponent(player)
		player == self.player1 ? self.player2 : self.player1
	end

	def switch_turns
		@turn == self.player1 ? @turn = self.player2 : @turn = self.player1
	end

	def can_declare_a_winner?
		if self.player1 != nil && self.player2 != nil
			self.player1.option != nil && self.player2.option != nil 
		else
			false
		end
	end	

end