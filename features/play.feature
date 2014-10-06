Feature: 	Player selects an option
			To play the game 
			The player must choose an option


	Scenario:	Player enters play page
				Given I am on the play page
				Then I should see "Choose one, please!"

	Scenario: 	Player must wait for opponent choise
				Given game is ready to play
				When I select a choise
				Then I should see "Waiting for your opponent to make a move"



