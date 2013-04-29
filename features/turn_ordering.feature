Feature: Sort Participants by the order they will act on a turn

  Background:
      Given there is a player named "Julias" with a speed of "9"
      And there is a player named "Marcus" with a speed of "2"
      And there is a player named "Kevin" with a speed of "8"
      And there is a player named "James" with a speed of "4"
      And there is a player named "Tom" with a speed of "10"

  @wip
  Scenario: no ties, no 12s
      Given "Julias" roles a "13" #9+13=22
      And "Marcus" roles a "9"    #2+9=11
      And "Kevin" roles a "17"    #8+17=25
      And "James" roles a "14"    #4+14=18
      And "Tom" roles a "11"      #10+11=21
      When the players are sorted to take an action on a turn
      Then "Kevin" is in position "1"      #25
      And "Julias" is in position "2"      #22
      And "Tom" is in position "3"         #21
      And "James" is in position "4"       #18
      And "Marcus" is in position "5"      #11

  Scenario: Marcus & Julias tie
    Given "Julias" roles a "13" #9+13=22
    And "Marcus" roles a "20"   #2+20=22
    And "Kevin" roles a "5"     #8+5=13
    And "James" roles a "14"    #4+14=18
    And "Tom" roles a "11"      #10+11=21
    And a tie exists between "Julias" and "Marcus for position "1"
      Given "Julias" rolls a "10"
        And "Marcus" rolls a "8"
    When the players are sorted to take an action on a turn
    Then "Julias" is in position "1"
    And "Marcus" is in position "2"
    And "Tom" is in position "3"
    And "James" is in position "4"
    And "Kevin" is in position "5"


  Scenario: Kevin rolls a 12, which always goes last
    Given "Julias" roles a "13"
    And "Marcus" roles a "9"
    And "Kevin" roles a "12"
    And "James" roles a "14"
    And "Tom" roles a "11"
    When the players are sorted to take an action on a turn
    And "Julias" is in position "1"
    And "Tom" is in position "2"
    And "James" is in position "3"
    And "Marcus" is in position "4"
    Then "Kevin" is in position "5"

  Scenario: Tom & Marcus both roll a 12
    Given "Julias" roles a "13"  #22
    And "Marcus" roles a "12"    #last
    And "Kevin" roles a "17"     #25
    And "James" roles a "14"     #18
    And "Tom" roles a "12"       #last
    And a tie exists between "Marcus" and "Tom" for position "last"
    Given "Tom" rolls a "5"
    And "Marcus" rolls a "7"
    When the players are sorted to take an action on a turn
    Then "Kevin" is in position "1"
    And "Julias" is in position "2"
    And "James" is in position "3"
    And "Marcus" is in position "4"
    And "Tom" is in position "5"


############ Read Scenarios
Feature: Timing Stage
  Scenario: Gavin vs. Brutus vs. Groth
    Given "Gavin" is fighting "Brutus" and "Groth"
      And "Gavin" has a "timing" attribute of "6"
      And "Brutus" has a "timing" attribute of "3"
      And "Groth" has a "timing" attribute of "4"
     When "Brutus" rolls a "d12" and receives "5"
      And "Groth" rolls a "d12" and receives a "5"
      And "Gavin" rolls a "d12" and receives a "10"
     Then "Brutus" is in position "1"
      And "Groth" is in position "2"
      And "Gavid" is in position "3"

Feature:



