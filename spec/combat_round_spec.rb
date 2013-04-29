require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe CombatRound do
  let(:engine) {CombatRound.new}
  let(:dice) {Dice.new}

  context 'Add Players' do
    it 'to the engine' do
      p1 = Player.new("Marcus",10)
      engine.add_player(p1)
      engine.get_player_list[0].should === p1

      p2 = Player.new("Julias",11)
      engine.add_player(p2)
      engine.get_player_list[1].should === p2

    end


    it 'but duplicate name will overwrite values' do
      player = Player.new("Marcus",1)
      player.current_roll = 2
      engine.add_player(player)

      player.name = "Marcus"
      player.agility = 10
      player.current_roll = 9
      engine.add_player(player)

      p = engine.get_player_by_name("Marcus")
      p.name.should == "Marcus"
      p.agility.should == 10
      p.current_roll.should == 9

    end

  end

  context 'Sort players by Timing' do
    it 'when no ties exist' do

      dice.store_sequence([8,19,14])

      p1 = Player.new("Marcus",10)
      p2= Player.new("Bob",5)
      p3 = Player.new("Sam",6)

      engine.add_player(p1)
      engine.add_player(p2)
      engine.add_player(p3)


      sorted_players = engine.get_players_by_timing(dice)

      sorted_players.should == [p2,p3,p1]
    end



    #
    #it 'and handles ties' do
    #  p1 = Player.new("Marcus",10)
    #
    #  p2 = Player.new("Tom",4)
    #
    #  p3 = Player.new("James",1)
    #
    #  p4 = Player.new("Kevin",2)
    #
    #  p5 = Player.new("Julias",11)
    #
    #  engine.add_player(p1)
    #  engine.add_player(p2)
    #  engine.add_player(p3)
    #  engine.add_player(p4)
    #  engine.add_player(p5)
    #
    #  sorted_players = engine.get_players_by_timing
    #  sorted_players.should == [p1,p5,p2,p4,p3]
    #
    #  p1.current_roll = p1.current_roll + 5
    #  p5.current_roll = p1.current_roll + 4
    #
    #  sorted_players = engine.get_players_by_timing
    #  sorted_players.should == [p1,p5,p2,p4,p3]
    #
    #
    #end

  end
end


