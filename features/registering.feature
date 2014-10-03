Feature:	Player registers to play RPS
			In order to start a game 
			a player of RPS
			must register

	Scenario:	Player is greeted
				Given I enter the homepage
				Then I see a welcome message "Welcome!"

	Scenario:	Player enters a name to register
				Given I am on the homepage
				When I enter my "name"
				Then I should be register to play RPS