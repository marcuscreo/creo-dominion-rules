Feature: Sort Participants by the order they will act on a turn

	Background:
		Given there is a player named "Julias" with a speed of "9"
		And there is a player named "Marcus" with a speed of "2"
		And there is a player named "Kevin" with a speed of "8"
		And there is a player named "James" with a speed of "4"
		And there is a player named "Tom" with a speed of "10"


	Scenario:
		Given "Julias" roles a "13"
		And "Marcus" roles a "9"
		And "Kevin" roles a "17"
		And "James" roles a "14"
		And "Tom" roles a "11"
		When the players are sorted to take an action on a turn
		Then "Kevin" is in position "1"
		And "Julias" is in position "2"
		And "Tom" is in position "3"
		And "James" is in position "4"
		And "Marcus" is in position "5"


