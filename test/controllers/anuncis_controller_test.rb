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
    assert_equal "200", response.code
    #assert_equal anunci, response.body[:anunci]
  end
  
  test "get anuncis index" do
  end
  
  test "post anunci" do
  end
  
  test "update anunci" do
  end
  
  test "delete anunci" do
  end
  
end
