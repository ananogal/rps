require 'game.rb'

describe Game  do

	let(:game) { Game.new }
	let(:player){double :player}


	it 'should be able to inicialize' do
		expect(game).not_to be nil 
	end

	it 'should return true if rules apply' do
		expect(game.is_player_the_winner?(:rock, :scissors)).to be true
	end

	it 'should return false if rules apply' do
		expect(game.is_player_the_winner?(:rock, :paper)).to be false
	end
end