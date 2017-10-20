require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  
  def correct_user
    User.new(name: "Lone Wolf", platform_name: "Google", email: "dude@example.com", active_token: "1234")
  end
  
end
