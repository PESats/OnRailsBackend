require 'test_helper'

class ShopTest < ActiveSupport::TestCase

  test "Valid shop" do
    shop = correct_shop

    assert shop.valid?
  end

  test "Shop with non-empty name" do
    shop = correct_shop
    shop.name = ""

    assert_not shop.valid?
  end

  test "Shop with non-empty latitude" do
    shop = correct_shop
    shop.latitude = nil

    assert_not shop.valid?
  end

  test "Shop with non-empty longitude" do
    shop = correct_shop
    shop.longitude = nil

    assert_not shop.valid?
  end

# :white_check_mark:
end
