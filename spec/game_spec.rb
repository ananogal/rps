require 'game.rb'

describe Game  do
	it 'should be able to inicialize' do
		game = Game.new
		expect(game).not_to be nil 
	end
 
end