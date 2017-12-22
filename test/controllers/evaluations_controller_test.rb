require 'test_helper'

class EvaluationsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "create a evaluation" do
    user = correct_user
    user.login
    user2 = correct_user2
    #p(user)
    #p(user2)
    #user2.login
    anun = correct_anunci
    bid_A = correct_bid
    #assert_equal "open",anun.status
    user.selectBid(bid_A.id)
    user.confirmTaskCompletion(anun.id)

    post user_evaluate_path(user2.id), params: {
      evaluation: {
        score: 3,
        user_id: user2.id,
        anunci_id: anun.id
      },      
      user_id: 1,
      active_token: user.active_token
    }
    assert_response :created
  end


end
