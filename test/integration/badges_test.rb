require 'test_helper'

class BadgesTest < ActionDispatch::IntegrationTest
  
  test "test badge" do
    badger = users(:badger)
    badger.login
    badger.reload
    
    assert_equal 0, Merit::Badge.find(1).users.count
    
    get user_path(badger.id), params:{
      user_id: badger.id, active_token: badger.active_token
    }
    
    assert_not_equal 0, Merit::Badge.find(1).users.count
  end
  
  test "welcome badge" do
    post users_login_path, params:{ 
      user: { email: "new_user@example.com", 
              platform_name: "Facebook",
              name: "Test User 42"
      }
    }
    
    user = User.last
    
    assert Merit::Badge.find(2).users.any? {|u| u[:id] == user.id}
  end
  
  test "first coupon badge" do
    user = blank_user
    user.login
    user.reload
    
    assert_equal 0, user.badges.count
    
    # Buy a coupon
    post user_bought_coupons_path(user), params: {
      coupon_id: Coupon.first.id,
      user_id: user.id, active_token: user.active_token
    }
    
    assert Merit::Badge.find(6).users.any? {|u| u[:id] == user.id}
  end
  
end
