require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  #TODO test-1: INDEX responses shouldn't include active_token in the JSON
  #TODO test-2: CREATE responses shall include active_token in the JSON
  
  test "user login and logout from request" do
    user = correct_user
    assert_not user.isLoggedIn?
    
    post users_login_path, params:{ 
      user: { email: user.email, 
              platform_name: user.platform_name,
              name: user.name
      }
    }
    assert user.reload.isLoggedIn?
    
    post users_logout_path, params:{
      user_id: user.id, active_token: user.active_token
    }
    assert_not user.reload.isLoggedIn?
  end
  
  test "badge test" do
    badger = users(:badger)
    badger.login
    badger.reload
    
    assert_equal 0, Merit::Badge.find(1).users.count
    
    get user_path(badger.id), params:{
      user_id: badger.id, active_token: badger.active_token
    }
    
    assert_not_equal 0, Merit::Badge.find(1).users.count
  end
  
end
