require 'test_helper'

class BidTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Bid must belong to a user" do
    anun = correct_anunci
    t_bid = Bid.new(anunci: anun)

    assert_not t_bid.save, "A bid has been created without a user"
  end

  test "Bid must belong to a Anunci" do
    us1 = correct_user
    t_bid = Bid.new(user: us1)
    assert_not t_bid.save, "A bid has been created without a anunci"

  end

  test "Each pair of user and anunci is unique" do
    user = correct_user2
    anun = correct_anunci
    #ja hi ha una bid de user(id=2) a anun(id=1) al fitxer bids.yml
    
    assert_raise ActiveRecord::RecordNotUnique do
      bid_B = Bid.new(user: user, anunci: anun, amount: 7)
      bid_B.save
    end
  end

  test "user_id of Bid can't be the same as its Anunci user_id" do
    us1 = correct_user
    anun = correct_anunci

    bid_A = Bid.new(user: us1, anunci: anun, amount: 10)

    assert_not bid_A.save
  end


  test "Amount of a bid can't be negative" do
    us1 = correct_user2
    anun = correct_anunci
    bid_A = Bid.new(user: us1, anunci: anun, amount: -4)
    assert_not bid_A.save

  end
 



end
