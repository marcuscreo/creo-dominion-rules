require 'bundler'


begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

# Setup code coverage
require 'simplecov'
require 'simplecov-gem-adapter'
require 'cucumber/rspec/doubles'


cucumber_coverage_dir = "out/cucumber/coverage"
FileUtils.rm_rf cucumber_coverage_dir
FileUtils.mkpath cucumber_coverage_dir

SimpleCov.start 'gem' do
  formatter = SimpleCov::Formatter::HTMLFormatter
  project_name "Dominion Rules Turn Sorting Features"
  coverage_dir cucumber_coverage_dir
end

## Setup our app driver
#require 'rest-client'
#require 'open-uri'

module DominionRulesAppDriver

  def start_combat_round
    @combat_round = CombatRound.new
  end

  def add_player_to_combat_round(player_name)
    @combat_round.add_player(Player.new(player_name))
  end

  def set_attribute_for_player(player_name,attribute,value)
    p = @combat_round.get_player_by_name(player_name)
    p.set_attribute("agility",value)
  end

  def set_dice_roll_value(player_name,roll_value)
    #todo - the problem is here.  Were' simply putting values into the array, without regard for who they belong to
    #todo - This will work IF, and only IF, we always deal with players in the same order.
    #todo - which is a lie!!!
    poop is here

    @roll_values = Array.new if @roll_values.nil?
    @roll_values << roll_value.to_i
  end

  def do_timing_order
    Dice.stub(:d12).and_return(*@roll_values)
    @sorted_player_array = @combat_round.do_timing_phase

    #@sorted_player_array.each {|p|puts "DEBUG: #{p.name} has an agility of #{p.agility} and a timing of #{p.timing}"}

  end

  def validate_player_position(player,position)
    @sorted_player_array[position.to_i].should == @combat_round.get_player_by_name(player)
  end

end

World(DominionRulesAppDriver)

# Require our 'production' code
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')
require_relative '../../lib/dominion_rules'

require 'rspec/expectations'
