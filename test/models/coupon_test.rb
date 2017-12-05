require 'test_helper'

class CouponTest < ActiveSupport::TestCase
  
  test "valid coupon" do
    coupon = correct_coupon
    
    assert coupon.valid?
  end
  
  test "Coupon with valid shop" do
    coupon = correct_coupon
    coupon.shop_id = nil

    assert_not coupon.valid?
  end
  
end
