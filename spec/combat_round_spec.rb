require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe CombatRound do
  let(:combat_round) {CombatRound.new}
  let(:dice) {Dice.new}

  context 'Add Players' do
    it 'to the engine' do
      p1 = Player.new("Marcus")
      p1.agility = 10
      combat_round.add_player(p1)
      combat_round.get_player_list[0].should === p1

      p2 = Player.new("Julias")
      p2.agility = 11
      combat_round.add_player(p2)
      combat_round.get_player_list[1].should === p2

    end
  end

  context "Retreive player" do
    it "by name" do
      p1 = Player.new("Marcus")
      p2 = Player.new("Tom")
      combat_round.add_player(p1)
      combat_round.add_player(p2)
      combat_round.get_player_by_name("Marcus").name.should == "Marcus"
    end
  end


  context 'Sort players by Timing' do
    it 'when no ties exist' do
      p1 = Player.new("Marcus")
      p1.dice.stub(:d12).and_return(8)
      p1.agility = 10

      p2 = Player.new("Bob")
      p2.dice.stub(:d12).and_return(19)
      p2.agility = 5

      p3 = Player.new("Sam")
      p3.dice.stub(:d12).and_return(14)
      p3.agility = 6

      combat_round.add_player(p1)
      combat_round.add_player(p2)
      combat_round.add_player(p3)

      combat_round.do_timing_phase
      combat_round.get_sorted_player_list.should == [p1,p3,p2]
    end


    it 'and handles ties' do
      p1 = Player.new("Marcus") #18 then 14
      p1.dice.stub(:d12).and_return(8,4)
      p1.agility = 10

      p2 = Player.new("Tom")     #6
      p2.dice.stub(:d12).and_return(2)
      p2.agility = 4

      p3 = Player.new("James")   #5
      p3.dice.stub(:d12).and_return(4)
      p3.agility = 1

      p4 = Player.new("Kevin")   #16
      p4.dice.stub(:d12).and_return(14)
      p4.agility = 2

      p5 = Player.new("Julias") #18 then 13
      p5.dice.stub(:d12).and_return(7,5)
      p5.agility = 11

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
      p1 = Player.new("Marcus") #18 then 14
      p1.dice.stub(:d12).and_return(8,4)
      p1.agility = 10

      p2 = Player.new("Tom")     #6
      p2.dice.stub(:d12).and_return(2)
      p2.agility = 4

      p3 = Player.new("James")   #5
      p3.dice.stub(:d12).and_return(4)
      p3.agility = 1

      p4 = Player.new("Kevin")   #14 <---- LOOSER!
      p4.dice.stub(:d12).and_return(12)
      p4.agility = 2

      p5 = Player.new("Julias") #18 then 13
      p5.dice.stub(:d12).and_return(7,5)
      p5.agility = 11

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


