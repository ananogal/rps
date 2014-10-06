require './lib/player'

describe Player do

	let (:player) { Player.new }

	it 'can add a name to a player' do	
		player.name = 'Ana'
		expect(player.name).to eq('Ana')
	end

	it 'can add an option to player' do 
		player.option = :rock
		expect(player.option).to eq(:rock)
	end

end