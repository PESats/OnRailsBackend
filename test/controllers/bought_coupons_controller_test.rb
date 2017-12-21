require 'test_helper'

class BoughtCouponsControllerTest < ActionDispatch::IntegrationTest

  test "get bought_coupons index" do
    user = correct_user
    user.login

    get user_bought_coupons_path(user), params: {
      user_id: user.id,
      active_token: user.active_token
    }

    assert_equal "200",   response.code
    user.bought_coupons.each do |coupon|
      assert_match coupon.title,          response.body
      assert_match coupon.description,    response.body
      assert_match coupon.discount.to_s,  response.body
    end
  end

  test "get bought_coupon" do
    user = correct_user
    user.login

    get user_bought_coupons_path(user), params: {
      user_id: user.id,
      active_token: user.active_token
    }
  end

  test "buy coupon" do
    user = correct_user
    user.login
    coupon = Coupon.last

    _initial_coins = user.coins

    post user_bought_coupons_path(user), params: {
      coupon_id: coupon.id,
      user_id: user.id, active_token: user.active_token
    }

    last_coupon = user.reload.bought_coupons.last
    
    assert_equal "200", response.code
    assert_equal coupon.title, last_coupon.title
    assert_equal coupon.description, last_coupon.description
    assert_equal coupon.discount, last_coupon.discount
    assert_equal _initial_coins - coupon.price, user.coins
  end

  test "delete bought_coupon" do
    user = users(:one)
    user.login

    delete user_bought_coupon_path(user, user.bought_coupons.first.id), params: {
      user_id: user.id,
      active_token: user.active_token
    }

    assert_equal "204", response.code
  end

end
