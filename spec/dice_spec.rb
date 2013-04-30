#require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
#
describe Dice do
  describe '::d12' do
    #let(:dice) {}

    it 'Returns the result of calling Random.rand with a range from 1 to 12' do
      Random.should_receive(:rand).with(1..12).once.and_return(8)
      Dice.d12.should == 8
    end

    it 'rolls numbers in a specific order' do
      Dice.stub(:d12).and_return(10,9,8,7,6)   #,9,8,7,6)
      Dice.d12.should == 10
      Dice.d12.should == 9
      Dice.d12.should == 8
      Dice.d12.should == 7
      Dice.d12.should == 6
    end
  end
end
