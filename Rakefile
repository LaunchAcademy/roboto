#!/usr/bin/env rake
require "bundler/gem_tasks"

begin
  require 'rspec/core/rake_task'

  desc "Run specs"
  RSpec::Core::RakeTask.new do |t|
  end

  task default: :spec
rescue LoadError
  puts "RSpec is not installed"
end

