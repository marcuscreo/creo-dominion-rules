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
      combat_round.get_sorted_player_list.should == [p2,p3,p1]
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


