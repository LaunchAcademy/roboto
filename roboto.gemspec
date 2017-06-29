# -*- encoding: utf-8 -*-
require File.expand_path('../lib/roboto/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Dan Pickett']
  gem.email         = ['dan.pickett@launchware.com']
  gem.description   = %q{A Rails Engine to help with robots.txt}
  gem.summary       = %q{A Rails Engine to help with robots.txt}
  gem.homepage      = "https://github.com/LaunchWare/roboto"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "roboto"
  gem.require_paths = ["lib"]
  gem.version       = Roboto::VERSION

  gem.add_dependency 'rails', '>= 4.2'

  gem.add_development_dependency 'rspec-rails', '>= 3.6'
  gem.add_development_dependency 'rspec-expectations'
  gem.add_development_dependency 'ammeter'
  gem.add_development_dependency 'capybara'
  gem.add_development_dependency 'fakefs'
  gem.add_development_dependency 'yard'
  gem.add_development_dependency 'redcarpet'

  #we need this for the dummy app
  gem.add_development_dependency 'sqlite3'
end
