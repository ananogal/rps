require 'game.rb'

describe Game  do

	let(:game) { Game.new }
	let(:player1){double :player1}
	let(:player2){double :player2}
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

	it 'should generate an answer' do
		answer = game.generate_answer
		expect(game.elements.include?(answer)).to be true
	end

end