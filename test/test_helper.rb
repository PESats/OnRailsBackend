require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def correct_user
    users(:one)
  end

  def correct_user2
    users(:two)
  end

  def correct_user3
    users(:three)
  end

  def correct_anunci
    anuncis(:one)
  end

  def correct_anunci2
    anuncis(:two)
  end

  def correct_shop
    shops(:one)
  end
  
  def correct_coupon
    coupons(:one)
  end


  def correct_comment
    comentaris(:one)
  end

  def correct_comment2
    comentaris(:two)
  end

  def correct_commentf2t1
    comentaris(:three)
  end

  def correct_commentf1t2
    comentaris(:four)
  end

  def correct_bid
    bids(:one)
  end

  def correct_bid2
    bids(:two)
  end

end
