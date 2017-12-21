require 'test_helper'

class ValidationsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "create a validation" do
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

    post user_validate_create_path(user2.id), params: {
      validation: {
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
