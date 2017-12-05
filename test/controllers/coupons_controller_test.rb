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
  
  test "create coupon" do
    user = users(:one)
    user.login
    user.reload

    title = "Dummy title"
    description = "Dummy description"

    post coupons_path, params: {
      coupon: {
        title: title,
        description: description,
        shop_id: user.shop.id
      },
      user_id: user.id, active_token: user.active_token
    }

    coupon = Coupon.last

    assert_equal "200",       response.code
    assert_equal title,       coupon.title
    assert_equal description, coupon.description

  end

end
