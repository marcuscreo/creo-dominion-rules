require File.expand_path(File.dirname(__FILE__) + '/spec_helper')


describe Player do
  let(:player) {Player.new("Marcus",10)}

  context 'test accessors' do
    it 'name' do
      player.current_roll = 9

      player.name.should == "Marcus"
      player.agility.should == 10
      player.current_roll.should == 9
      player.timing.should == 19

    end


  end

end