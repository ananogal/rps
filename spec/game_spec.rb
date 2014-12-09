require 'game.rb'

describe Game  do

	let(:game) { Game.new }
	let(:player1){double :player1,:option => :rock, option: :rock }
	let(:player2){double :player2, :option => :paper, option: :paper}
	let(:player3){double :player3}

	it 'should be able to inicialize' do
		expect(game).not_to be nil 
	end

	it 'should have the elements' do
		expect(game.elements).not_to be nil 
	end

	it 'can have players add to' do
		game.add_player(player1) 
		expect(game.player1).to eq(player1)
	end	

	it 'can add a second player' do
		game.add_player(player1)
		game.add_player(player2)
		expect(game.player2).to eq(player2)
	end 

	it 'can only have 2 players' do
		game.add_player(player1)
		game.add_player(player2)
		game.add_player(player3)
		expect(game.player2).to eq(player2)
		expect(game.player1).to eq(player1)
	end

	it 'should return true if rules apply' do
		expect(game.is_player_the_winner?(:rock, :scissors)).to be true
	end

	it 'should return false if rules apply' do
		expect(game.is_player_the_winner?(:rock, :paper)).to be false
	end

	it 'should return tie if players have choosen the same option' do
		expect(game.rules_result(:rock, :rock)).to eq("tie")
	end

	it 'should return win if players option beats opponent option' do
		expect(game.rules_result(:rock, :scissors)).to eq("win")
	end

	it 'should return loose if opponent option beats players option' do
		expect(game.rules_result(:rock, :rock)).to eq("loose")
	end

	it 'should generate an answer' do
		answer = game.generate_answer
		expect(game.elements.include?(answer)).to be true
	end

	it 'should know which player is in turn' do
		game.add_player(player1)
		expect(game.turn).to eq(player1) 
	end 

	context 'play' do

		before do
			game.add_player(player1)
			game.add_player(player2) 
		end

		it 'should be able to select players opponent' do
			expect(game.opponent(player2)).to eq(player1)
		end

		it 'should switch turns' do
			game.turn
			game.switch_turns
			expect(game.turn).to eq(player2)
		end 

		it 'should be able to declare a winner' do
			
			expect(game.can_declare_a_winner?).to be true
		end
	end

	it 'should return false if no players added' do
		expect(game.can_declare_a_winner?).to be false 
	end

end