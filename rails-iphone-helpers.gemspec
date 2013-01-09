# encoding: utf-8

require File.expand_path('../lib/rails_iphone_helpers/version', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'rails-iphone-helpers'
  s.version       = RailsIphoneHelpers::VERSION
  s.authors       = ['Anton Lindqvist']
  s.email         = ['anton@qvister.se']
  s.homepage      = 'http://github.com/mptre/rails-iphone-helpers'
  s.description   = 'iPhone specific HTML tags helper'
  s.summary       = 'Rails plugin providing helpers used to generate iPhone specific html tags.'
  s.files         = Dir['lib/**/*.rb']
  s.test_files    = Dir['test/**/*_test.rb']
  s.require_paths = ['lib']
  s.add_runtime_dependency 'actionpack', '~> 3.2.0'
  s.add_development_dependency 'awesome_print', '~> 1.1.0'
  s.add_development_dependency 'minitest', '~> 4.4.0'
  s.add_development_dependency 'rake', '~> 10.0.0'
end
