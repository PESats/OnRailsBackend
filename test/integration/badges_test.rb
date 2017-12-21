require 'test_helper'

class BadgesTest < ActionDispatch::IntegrationTest
  
  test "test badge test" do
    badger = users(:badger)
    badger.login
    badger.reload
    
    assert_equal 0, Merit::Badge.find(1).users.count
    
    get user_path(badger.id), params:{
      user_id: badger.id, active_token: badger.active_token
    }
    
    assert_not_equal 0, Merit::Badge.find(1).users.count
  end
  
  test "first badge test" do
    post users_login_path, params:{ 
      user: { email: "new_user@example.com", 
              platform_name: "Facebook",
              name: "Test User 42"
      }
    }
    
    user = User.last
    
    assert_equal 1, user.badges.count
  end
  
end
