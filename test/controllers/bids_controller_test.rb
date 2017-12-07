require 'test_helper'

class BidsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  # test "create a new bid" do
  #   anun = correct_anunci
  #   us1 = correct_user3
  #   us1.login
  #   #p("Users: "+User.count.to_s)
  #   #p("Anuncis: "+Anunci.count.to_s)
  #   #p(Bid.find(3))

  #   bAmount = 300

  #   post user_bids_path(us1.id), params: {
  #     bid: {
  #       amount: bAmount,
  #       anunci_id: anun.id
  #     },
  #     user_id: us1.id,
  #     active_token: us1.active_token
  #   }
  #   assert_equal "201",response.code
  # end

  test "update a bid value" do
    anun = correct_anunci
    user = correct_user2
    user.login
    bid_A = correct_bid
    new_amount = 50
    assert_changes 'bid_A.reload.amount' do
      put user_bid_path(user.id,bid_A.id), params: {
        bid: {
          amount: new_amount
        },
        user_id: user.id,
        active_token: user.active_token
      }
      assert_response :success
    end
  end

  test "Select a bid" do
    user = correct_user
    user.login
    anun = correct_anunci
    bid_A = correct_bid
    assert_equal "open",anun.status
    p("select bid-> anun.status = "+anun.status)


    put user_anunci_select_path(user.id,anun.id) , params: {
      bid_id: bid_A.id,
      user_id: user.id,
      active_token: user.active_token
    }
    assert_response :success
    assert_equal "closed",anun.reload.status
    assert bid_A.reload.accepted
       
  end

  test "Cancel Selection" do
    user = correct_user
    user.login
    anun = correct_anunci
    bid_A = correct_bid
    assert_equal "open",anun.status
    user.selectBid(bid_A.id)
    assert_equal "closed",anun.reload.status
    assert bid_A.reload.accepted

    put user_anunci_cancel_path(user.id,anun.id), params: {
      user_id: user.id,
      active_token: user.active_token
    }
    assert_response :success
    assert_equal "open",anun.reload.status
    assert_not bid_A.reload.accepted
    assert_nil anun.reload.selectedBid
  end

  test "Complete Selection" do
    user = correct_user
    user.login
    user2 = correct_user2
    anun = correct_anunci
    bid_A = correct_bid
    assert_equal "open",anun.status
    user.selectBid(bid_A.id)
    assert_equal "closed",anun.reload.status
    assert bid_A.reload.accepted

    money = bid_A.amount

    assert_difference("user.reload.coins",-money) do
      assert_difference("user2.reload.coins",money) do
        put user_anunci_complete_path(user.id,anun.id), params: {
          user_id: user.id,
          active_token: user.active_token
        }
        assert_response :success
        assert_equal "completed",anun.reload.status
      end
    end
  end


end
