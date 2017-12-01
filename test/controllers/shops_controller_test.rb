require 'test_helper'

class ShopsControllerTest < ActionDispatch::IntegrationTest

  test "get shop correct token" do
    shop = correct_shop
    user = correct_user
    user.login

    get shop_path(shop.id), params: {
      user_id: user.id,
      active_token: user.active_token,
    }

    assert_equal "200",             response.code
    assert_match shop.name,         response.body
    assert_match shop.description,  response.body
  end

  test "get shops index" do
    user = correct_user
    user.login

    get shops_path, params: {
      user_id: user.id,
      active_token: user.active_token,
    }

    assert_equal "200", response.code
  end

end
