class Game

	def initialize 
		@winner = nil
		@rules = {}
		@rules = {:rock => :scissors, :paper =>:rock, :scissors => :paper}
	end 

	def is_player_the_winner?(player_opt, computer_opt)
	 	@rules[player_opt] == computer_opt
	end
end