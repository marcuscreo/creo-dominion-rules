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
  #def go_to_home_page
  #  begin
  #    @response = RestClient.get 'http://localhost:4567/'
  #    @error = nil
  #  rescue => e
  #    @error = e
  #  end
  #end
  #
  #def page_content
  #  fail "There is no response, maybe you got an error?" if @response.nil?
  #  @response.to_str
  #end
  #
  #def check_for_error
  #  @error.should_not be_nil
  #end
  #
  #def set_response_stub(text)
  #  @response = RestClient.post 'http://localhost:4567/setstub',text
  #end
  #
  #def geocode_address(address)
  #  @response = RestClient.get "http://localhost:4567/maps/api/geocode/json?address=#{URI::encode(address)}&sensor=false"
  #end
  #
  #def result_code
  #  @response.code
  #end
  #
  #def status
  #  @json ||= JSON.parse(@response.to_str)
  #  @json['status']
  #end
  #
  #def latitude
  #  @json ||= JSON.parse(@response.to_str)
  #  @json['response_body']['geometry']['location']['lat'].to_f
  #end
  #
  #def longitude
  #  @json ||= JSON.parse(@response.to_str)
  #  @json['response_body']['geometry']['location']['lng'].to_f
  #end
end

World(DominionRulesAppDriver)

# Require our 'production' code
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')
require_relative '../../lib/dominion_rules'

require 'rspec/expectations'
