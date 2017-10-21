require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "empty users shall not exist" do
    user = User.new
    assert_not user.save, "An empty user has been added to the DB"
  end

  test "users must be logged from a platform" do
    user = correct_user
    user.platform_name = nil
    assert_not user.save, "An user with no platform has been saved"
  end

  test "users must be logged from Facebook, Google or Twitter" do
    user = correct_user
    user.platform_name = "Reddit"
    assert_not user.save, "An user from an account different from FB, Google or Twitter has been saved"
  end
  
  test "users must have an email" do
    user = correct_user
    user.email = nil
    assert_not user.save, "An user with no email has been saved"
  end
  
  test "user login and logout" do
    user = users(:one)
    assert_not user.isLoggedIn?
    
    user.login
    assert user.isLoggedIn?
    
    user.logout
    assert_not user.isLoggedIn?
  end
  
  # TODO: User name test


  # test "users with no username shall no" do
  #   user = User.new(name: "testName",image_url:nil,platform_name:"twitter")
  #   assert_not user.save
  #
  # end

end
