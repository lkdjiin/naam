# -*- encoding: utf-8 -*-

require 'rake'
require 'rspec/core/rake_task'

desc 'Test Naam'
task :default => :spec

desc 'Test Naam with rspec'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ['--color']
end

desc 'Check for code smells'
task :reek do
  puts 'Checking for code smells...'
  files = Dir.glob 'lib/**/*.rb'
  args = files.join(' ')
  sh "reek --quiet #{args} | ./reek.sed"
end

desc 'Generate documentation'
task :doc do
  sh "yard --plugin tomdoc"
end

desc "Generate the changelog"
task :changelog do
  system "git changelog > Changelog.markdown"
end

