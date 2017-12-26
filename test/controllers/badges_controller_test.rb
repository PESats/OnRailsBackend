require 'test_helper'

class BadgesControllerTest < ActionDispatch::IntegrationTest
  
  test "badges index" do
    user = correct_user
    user.login
    
    get badges_path, params: {
      user_id: user.id, active_token: user.active_token
    }
    
    assert_equal "200", response.code
  end
  
  test "get user badges" do
    user = correct_user
    user.login
    get "/users/#{user.id}/badges", params: {
      user_id: user.id, active_token: user.active_token
    }
    
    assert_equal "200", response.code
  end
  
end
