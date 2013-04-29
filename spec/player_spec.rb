require File.expand_path(File.dirname(__FILE__) + '/spec_helper')


describe Player do
  let(:player) {Player.new("Marcus",10)}

  context 'test accessors' do
    it 'name' do
      Dice.stub(:d12).and_return(10,9,8,7,6)
      player.name.should == "Marcus"
      player.agility.should == 10
      (player.agility + Dice.d12).should == 20
      (player.agility + Dice.d12).should == 19
      (player.agility + Dice.d12).should == 18
      (player.agility + Dice.d12).should == 17
      (player.agility + Dice.d12).should == 16
    end


  end

end