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





#  Scenario: Drunken solider tie
#    A soldier and his drunken mate attack a merchant in a half-empty pub. The Soldier gets a Timing Score of 10.
#    The Drunk and the Merchant both end up with Timing Scores of 7, so they roll again.



#  Scenario: Brutus roles a 12, and should go last
#    Given a combat round is starting
#    And "Gavin" joins the combat round with a "agility" attribute of "6"
#    And "Brutus" joins the combat round with a "agility" attribute of "3"
#    And "Groth" joins the combat round with a "agility" attribute of "4"
#    When "Brutus" rolls a "d12" and receives a "10"
#    And "Groth" rolls a "d12" and receives a "2"
#    And "Gavin" rolls a "d12" and receives a "12"
#    And the timing order is calculated
#    Then "Brutus" is in position "1"
#    And "Groth" is in position "2"
#    And "Gavin" is in position "3"
#
#

  @tie
  Scenario: Brutus and Gavin tie for first
    Given a combat round is starting
    And "Gavin" joins the combat round with a "agility" attribute of "6"
    And "Brutus" joins the combat round with a "agility" attribute of "3"
    And "Groth" joins the combat round with a "agility" attribute of "4"

    When "Brutus" rolls a "d12" and receives a "9"
    And "Groth" rolls a "d12" and receives a "5"
    And "Gavin" rolls a "d12" and receives a "6"
      When "Gavin" and "Brutus" tie for first
    #
    #todo - the code currently doesn't support this.  It simply replaces the old value, and it should add to it
    #
      Then "Gavin" rolls a "d12" and receives a "9"
      Then "Brutus" rolls a "d12" and receives a "3"

    And the timing order is calculated
    Then "Brutus" is in position "2"
    And "Groth" is in position "1"
    And "Gavin" is in position "3"



