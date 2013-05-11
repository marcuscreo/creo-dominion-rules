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
    @player_roll_hash = Hash.new
  end

  def add_player_to_combat_round(player_name)
    @combat_round.add_player(Player.new(player_name))
  end

  def set_attribute_for_player(player_name,attribute,value)
    p = @combat_round.get_player_by_name(player_name)
    p.set_attribute(attribute,value)
  end

  def set_dice_roll_value(player_name,roll_value)
    #todo - this should work if we call it twice...not sure how yet.
    if @player_roll_hash[player_name].nil?
      @player_roll_hash[player_name] = Array.new
    end

    @player_roll_hash[player_name] << roll_value.to_i
  end

  def do_timing_order
    #Set rolls into players
    @combat_round.get_player_list.each do |player|
      player.dice.stub(:d12).and_return(*@player_roll_hash[player.name])
    end

    #Set the timing order
    @sorted_player_array = @combat_round.do_timing_phase
  end

  def validate_player_position(player_name,position)
    @list = @combat_round.get_sorted_player_list

    count=0
    @list.each do |player|
      count += 1
    end

    @list[position.to_i - 1].name.should == player_name
  end

end

World(DominionRulesAppDriver)

# Require our 'production' code
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')
require_relative '../../lib/dominion_rules'

require 'rspec/expectations'
