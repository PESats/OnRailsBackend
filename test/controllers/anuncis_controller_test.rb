require 'test_helper'

class AnuncisControllerTest < ActionDispatch::IntegrationTest
  
  test "get anunci correct token" do
    anunci = correct_anunci
    user = correct_user
    user.login
    
    get anunci_path(anunci.id), params: {
      user_id: user.id,
      active_token: user.active_token,
    }
    
    assert_equal "200",              response.code
    
    assert_match anunci.title,       response.body
    assert_match anunci.description, response.body
    #assert_match anunci.latitude,    response.body
    #assert_match anunci.longitude,   response.body
    assert_match anunci.reward.to_s, response.body
  end
  
  test "get anuncis index" do
    user = correct_user
    user.login
    
    get anuncis_path, params: {
      user_id: user.id,
      active_token: user.active_token,
    }
    
    assert_equal "200", response.code
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
      user_id: user.id, active_token: user.active_token
    }
    
    anunci = user.reload.anuncis.last
    
    assert_equal title,       anunci.title
    assert_equal description, anunci.description
    assert_equal latitude,    anunci.latitude
    assert_equal longitude,    anunci.longitude
    assert_equal reward,      anunci.reward
    
  end
  
  test "update anunci" do
    anunci = correct_anunci
    user = correct_user
    user.login
    
    last_update = anunci.updated_at
    
    put anunci_path(anunci.id), params: {
      anunci: {
        title: "Modified Title",
        description: "Modified description bla bla bla",
        latitude: 2.2,
        longitude: 1.1,
        reward: 1
      },
      user_id: user.id,
      active_token: user.active_token
    }
    
    assert_not_equal last_update, anunci.reload.updated_at
  end
  
  test "delete anunci" do
    anunci = correct_anunci
    user = correct_user
    user.login
    
    delete anunci_path(anunci.id), params: {
      user_id: user.id,
      active_token: user.active_token
    }
    
    assert_not Anunci.exists?(anunci.id)
  end
  
end
