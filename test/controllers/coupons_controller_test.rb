require 'test_helper'

class CouponsControllerTest < ActionDispatch::IntegrationTest
  
  test "get coupon correct token" do
    coupon = correct_coupon
    user = correct_user
    user.login

    get coupon_path(coupon.id), params: {
      user_id: user.id,
      active_token: user.active_token
    }

    assert_equal "200",               response.code
    assert_match coupon.title,        response.body
    assert_match coupon.description,  response.body
    assert_match coupon.discount.to_s,     response.body
  end
  
  test "get coupons index" do
    user = correct_user
    user.login
  
    get coupons_path, params: {
      user_id: user.id,
      active_token: user.active_token
    }
  
    assert_equal "200", response.code
  end
  
  test "create coupon CORRECT shop" do
    user = users(:one)
    user.login

    title = "Dummy title"
    description = "Dummy description"
    discount = 20

    post coupons_path, params: {
      coupon: {
        title: title,
        description: description,
        discount: discount,
        shop_id: user.shop.id
      },
      user_id: user.id, active_token: user.active_token
    }

    coupon = Coupon.last

    assert_equal "200",       response.code
    assert_equal title,       coupon.title
    assert_equal description, coupon.description
    assert_equal discount,    coupon.discount
  end
  
  test "create coupon NOT owned shop" do
    user = users(:one)
    user.login

    title = "Dummy title"
    description = "Dummy description"
    discount = 20

    post coupons_path, params: {
      coupon: {
        title: title,
        description: description,
        discount: discount,
        shop_id: Shop.last.id
      },
      user_id: user.id, active_token: user.active_token
    }
    
    assert_equal "400", response.code
  end
  
  test "delete coupon" do
    user = users(:one)
    user.login
    
    delete coupon_path(user.shop.coupons.first.id), params: {
      user_id: user.id, 
      active_token: user.active_token
    }
    
    assert_equal "204", response.code
  end

end
