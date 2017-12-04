require 'test_helper'

class BidsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "create a new bid" do
    anun = correct_anunci
    us1 = correct_user3
    us1.login
    #p("Users: "+User.count.to_s)
    #p("Anuncis: "+Anunci.count.to_s)
    #p(Bid.find(3))

    bAmount = 300

    post bids_path, params: {
      bid: {
        amount: bAmount,
        anunci_id: anun.id
      },
      user_id: us1.id,
      active_token: us1.active_token
    }
    assert_equal "201",response.code
  end

  test "update a bid value" do
    anun = correct_anunci
    user = correct_user2
    user.login
    bid_A = correct_bid
    new_amount = 50
    assert_changes 'bid_A.reload.amount' do
      put bid_path(bid_A.id), params: {
        bid: {
          amount: new_amount
        },
        user_id: user.id,
        active_token: user.active_token
      }
      assert_response :success
    end
  end

  




end
