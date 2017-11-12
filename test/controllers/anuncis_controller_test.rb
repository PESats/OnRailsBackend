require 'test_helper'

class AnuncisControllerTest < ActionDispatch::IntegrationTest
  
  test "get anunci correct token" do
    anunci = correct_anunci
    user = correct_user
    
    user.login
    user = user.reload
    
    get anunci_path(anunci), params: {
      user: { id: user.id, active_token: user.active_token },
      anunci: { id: anunci.id }
    }
    
    assert_equal "200",              response.code
    
    assert_match anunci.title,       response.body
    assert_match anunci.description, response.body
    #assert_match anunci.latitude,    response.body
    #assert_match anunci.longitude,   response.body
    assert_match anunci.reward.to_s, response.body
  end
  
  test "get anuncis index" do
  end
  
  test "create anunci" do
    user = correct_user
    user.login
    user.reload
    
    title = "Dummy title"
    description = "Dummy description"
    latitude = 2.7
    longitude = 1.5
    reward = 3
    
    post anuncis_path, params: {
      anunci: {
        title: title,
        description: description,
        latitude: latitude,
        longitude: longitude,
        reward: reward
      },
      user: { id: user.id, active_token: user.active_token }
    }
    
    anunci = user.reload.anuncis.last
    
    assert_equal title,       anunci.title
    assert_equal description, anunci.description
    assert_equal latitude,    anunci.latitude
    assert_equal longitude,    anunci.longitude
    assert_equal reward,      anunci.reward
    
  end
  
  test "update anunci" do
  end
  
  test "delete anunci" do
  end
  
end
