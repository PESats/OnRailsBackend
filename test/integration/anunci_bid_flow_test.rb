require 'test_helper'

class AnunciBidFlowTest < ActionDispatch::IntegrationTest
  
  # MODEL LEVEL 

  test "A user can accept one bid of on of their anuncis" do

    user = correct_user
    user.login
    anun = correct_anunci
    bid_A = correct_bid
    has_selected = anun.reload.selectedBid == nil
    
    #p(bid_A)

    user.selectBid(bid_A.id)
    
    p("status of Anun(user_accept_anuncis): " + has_selected.to_s )
   
    assert_equal "closed", anun.reload.status
    assert bid_A.reload.accepted
  end

  test "A user can cancel the acceptance of a bid of their anunci" do
    user = correct_user
    user.login
    anun = correct_anunci
    has_selected = anun.selectedBid == nil 
    
    bid_A = correct_bid    
    user.selectBid(bid_A.id)
    assert_equal "closed", anun.reload.status
    p("status of Anun(user_cancel_anuncis): " + has_selected.to_s)    
    user.cancelBid(anun.id)
    assert_equal "open", anun.reload.status
    assert_not bid_A.reload.accepted
  end

  test "A user can confirm the completion of the task in the anunci and pay the coins to the bids owner" do
    user = correct_user
    user.login
    user2 = correct_user2
    anun = correct_anunci
    bid_A = correct_bid    
    user.selectBid(bid_A.id)
    assert_equal "closed", anun.reload.status
    money_u1 = user.coins
    money_u2 = user2.coins
    finalPrize = bid_A.amount
    user.confirmTaskCompletion(anun.id)
    assert_equal "completed", anun.reload.status
    assert_equal money_u1-finalPrize, user.reload.coins
    assert_equal money_u2+finalPrize, user2.reload.coins
  end

  test "A user can't create a bid for an Anunci that is closed" do
    user = correct_user
    user.login
    user2 = correct_user3
    anun = correct_anunci
    bid_A = correct_bid    
    user.selectBid(bid_A.id)
    assert_equal "closed", anun.reload.status
    bid_B = user2.bids.new(amount: 30, anunci: anun)
    assert_not bid_B.save
  end
end
