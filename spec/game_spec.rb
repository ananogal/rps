require 'game.rb'

describe Game  do

	let(:game) { Game.new }
	let(:player){double :player}


	it 'should be able to inicialize' do
		expect(game).not_to be nil 
	end

	it 'should have the elements' do
		expect(game.elements).not_to be nil 
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