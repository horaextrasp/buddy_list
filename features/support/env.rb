require 'rubygems'
require 'spork'

ENV["RAILS_ENV"] ||= "test"
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  require 'cucumber/formatter/unicode' # Remove this line if you don't want Cucumber Unicode support
  require 'cucumber/rails/rspec'
  require 'cucumber/rails/world'
  require 'cucumber/rails/active_record'
  require 'cucumber/web/tableish'

  require 'capybara/rails'
  require 'capybara/cucumber'
  require 'capybara/session'
  require 'cucumber/rails/capybara_javascript_emulation' # Lets you click links with onclick javascript handlers without usingculerity or @javascript
  Capybara.default_selector = :css

  Cucumber::Rails::World.use_transactional_fixtures = true

  # If you set this to true, Rails will rescue all errors and render error
  # pages, more or less in the same way your application would behave in the
  # default production environment. It's not recommended to do this for all
  # of your scenarios, as this makes it hard to discover errors in your application.
  ActionController::Base.allow_rescue = false

end

Spork.each_run do
  # This code will be run each time you run your specs.

end

# - Any code that is left outside of the blocks will be ran during preforking
#   and during each_run!
