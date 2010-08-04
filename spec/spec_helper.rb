require 'rubygems'
require 'spork'

ENV["RAILS_ENV"] ||= 'test'
Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  # Requires supporting files with custom matchers and macros, etc,
  # in ./support/ and its subdirectories.

  Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

  RSpec.configure do |config|
    config.mock_with :rspec

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, comment the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = true
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.

end





