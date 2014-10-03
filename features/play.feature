Feature: 	Player selects an option
			To play the game 
			The player must choose an option


	Scenario:	Player selects the winner option
				Given I am on the play page
				When I choose an option
				Then I should see "You Win!!!!!"

	Scenario:	Player selects the looser option
				Given I am on the play page
				When I choose an option
				Then I should see "You loose!"