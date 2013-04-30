require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe CombatRound do
  let(:combat_round) {CombatRound.new}
  let(:dice) {Dice.new}

  context 'Add Players' do
    it 'to the engine' do
      p1 = Player.new("Marcus",10)
      combat_round.add_player(p1)
      combat_round.get_player_list[0].should === p1

      p2 = Player.new("Julias",11)
      combat_round.add_player(p2)
      combat_round.get_player_list[1].should === p2

    end
  end

  context 'Sort players by Timing' do
    it 'when no ties exist' do

      Dice.stub(:d12).and_return(8,19,14)
      p1 = Player.new("Marcus",10)
      p2= Player.new("Bob",5)
      p3 = Player.new("Sam",6)

      combat_round.add_player(p1)
      combat_round.add_player(p2)
      combat_round.add_player(p3)

      combat_round.do_timing_phase
      combat_round.get_sorted_player_list.should == [p1,p3,p2]
    end


    it 'and handles ties' do
      Dice.stub(:d12).and_return(8,2,4,14,7,4,5)
      p1 = Player.new("Marcus",10) #18 then 14
      p2 = Player.new("Tom",4)     #6
      p3 = Player.new("James",1)   #5
      p4 = Player.new("Kevin",2)   #16
      p5 = Player.new("Julias",11) #18 then 13

      combat_round.add_player(p1)
      combat_round.add_player(p2)
      combat_round.add_player(p3)
      combat_round.add_player(p4)
      combat_round.add_player(p5)

      combat_round.do_timing_phase
      sorted_players = combat_round.get_sorted_player_list
      sorted_players.should == [p3,p2,p4,p1,p5]

    end

    it 'and handles loosing rolls (12s)'  do
      Dice.stub(:d12).and_return(8,2,4,12,7,4,5)
      p1 = Player.new("Marcus",10) #18 then 14
      p2 = Player.new("Tom",4)     #6
      p3 = Player.new("James",1)   #5
      p4 = Player.new("Kevin",2)   #14 <---- LOOSER!
      p5 = Player.new("Julias",11) #18 then 13

      combat_round.add_player(p1)
      combat_round.add_player(p2)
      combat_round.add_player(p3)
      combat_round.add_player(p4)
      combat_round.add_player(p5)

      combat_round.do_timing_phase
      sorted_players = combat_round.get_sorted_player_list
      sorted_players.should == [p4,p3,p2,p1,p5]

    end

  end
end


