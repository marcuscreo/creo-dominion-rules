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
  def  set_player_agility(player,agility)

  end

  def set_player_timing(player,role)

  end

  def sort_players_by_timing

  end

  def validate_player_position(player,position)

  end

end

World(DominionRulesAppDriver)

# Require our 'production' code
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')
require_relative '../../lib/dominion_rules'

require 'rspec/expectations'
