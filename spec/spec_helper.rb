$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'

# Setup code coverage
require 'simplecov'
require 'simplecov-gem-adapter'

rspec_coverage_dir = "out/rspec/coverage"
FileUtils.rm_rf rspec_coverage_dir
FileUtils.mkpath rspec_coverage_dir

SimpleCov.start 'gem' do
  formatter = SimpleCov::Formatter::HTMLFormatter
  project_name "Dominion Rules Sorting Specs"
  coverage_dir rspec_coverage_dir
end

# Require our 'production' code
#require '../lib/dominion_rules/dominion_rules/dominion_rules'
require 'dominion_rules'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|

end