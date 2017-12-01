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

  test "create shop" do
    user = correct_user
    user.login
    user.reload

    name = "Dummy name"
    description = "Dummy description"
    latitude = 2.7
    longitude = 1.5

    post shops_path, params: {
      shop: {
        name: name,
        description: description,
        latitude: latitude,
        longitude: longitude
      },
      user_id: user.id, active_token: user.active_token
    }

    shop = user.reload.shop

    assert_equal "200",       response.code
    assert_equal name,        anunci.name
    assert_equal description, anunci.description
    assert_equal latitude,    anunci.latitude
    assert_equal longitude,   anunci.longitude

  end

end
