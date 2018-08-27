ENV['RACK_ENV'] = 'test'


require 'bundler'
# I want access to capybara's domain specific language
require 'capybara/dsl'

Bundler.require(:default, :test)
require File.expand_path('../../config/environment.rb', __FILE__)


DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
  config.before(:all) do
    DatabaseCleaner.clean
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.include Capybara::DSL
end


Capybara.app = SetList
Capybara.save_path = 'tmp/capybara'
