#require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
#
#describe Dice do
#  describe '::d12' do
#    it 'Returns the result of calling Random.rand with a range from 1 to 12' do
#      Random.should_receive(:rand).with(1..12).once.and_return(8)
#      Dice.d12.should == 8
#    end
#  end
#end