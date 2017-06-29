# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
# require "rails/test_help"

require 'capybara/rspec'
require 'rspec/rails'
require 'rspec/expectations'
require 'ammeter/init'

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |c|
end

