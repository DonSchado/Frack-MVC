require 'capybara/rspec'
require 'rack'

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Capybara::DSL
end

RSpec.configure do |config|
  config.default_formatter = 'doc'
  config.order = :random

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end
end
