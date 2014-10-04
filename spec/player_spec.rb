require './lib/player'

describe Player do

	it 'can add a name to a player' do
		player = Player.new
		player.name = 'Ana'
		expect(player.name).to eq('Ana')
	end

end