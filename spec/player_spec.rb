require File.expand_path(File.dirname(__FILE__) + '/spec_helper')


describe Player do
  let(:player) {Player.new}

  context 'test accessors' do
    it 'name' do
      player.name = "Marcus"
      player.agility = 10
      player.name.should == "Marcus"
      player.agility.should == 10
    end


  end
end