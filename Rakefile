# encoding: utf-8

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end

require 'cucumber/rake/task'
Cucumber::Rake::Task.new(:terse_features) do |task|
  task.cucumber_opts = [
      "--format progress",
  ]
end

Cucumber::Rake::Task.new(:features) do |task|
  task.cucumber_opts = [
      "--format pretty",
  ]
end

task :default => [:terse_features]

