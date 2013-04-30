Feature: Sort Participants by the order they will act on a turn

  Scenario: Gavin vs. Brutus vs. Groth
    Given a combat round is starting
      And "Gavin" joins the combat round with a "agility" attribute of "6"
      And "Brutus" joins the combat round with a "agility" attribute of "3"
      And "Groth" joins the combat round with a "agility" attribute of "4"
     When "Brutus" rolls a "d12" and receives a "5"
      And "Groth" rolls a "d12" and receives a "5"
      And "Gavin" rolls a "d12" and receives a "10"
      And the timing order is calculated
     Then "Brutus" is in position "1"
      And "Groth" is in position "2"
      And "Gavin" is in position "3"





