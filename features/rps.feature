Feature:	Player registers to play RPS
			In order to start a game 
			a player of RPS must register
			and make a choice

	Scenario:	Player is greeted
				Given I enter the homepage
				Then I see a welcome message "Welcome to Rock, paper, scissors!"

	Scenario: Player register without a name
				Given I am on the homepage
				When I click 'sign in' without given a name
				Then I should see a message 'Please enter your name'

	Scenario:	Player enters a name to register
				Given I am on the homepage
				When I enter my "name"
				Then I should see a welcome message with my name

	Scenario: 	Player must wait for another player to join the game
	 			Given I am register in as "Ana" 
	 			When  a second player register 
	 			Then  I should go to play page in Ana's browser
	 			And 	see message "Your oppunent turn, please wait" in second player browser

	Scenario: 	Player must wait for opponent choise
				Given I am in the play page
				When I select a choice
 				Then I should see "Waiting for your opponent to make a move" 