class Game
	attr_reader :elements

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
end