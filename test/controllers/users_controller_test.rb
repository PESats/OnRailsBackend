require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  #TODO test-1: INDEX responses shouldn't include active_token in the JSON
  #TODO test-2: CREATE responses shall include active_token in the JSON
  
  test "user login and logout from request" do
    user = correct_user
    assert_not user.isLoggedIn?
    
    post users_login_path, params:{ 
      user: { email: user.email, 
              platform_name: user.platform_name
      }
    }
    assert user.reload.isLoggedIn?
    
    post users_logout_path, params:{ 
      user: { id: user.id, active_token: user.active_token} }
    assert_not user.reload.isLoggedIn?
  end

end
