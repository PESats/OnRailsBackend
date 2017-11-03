require 'test_helper'

class AnuncisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get anuncis_index_url
    assert_response :success
  end

  test "should get create" do
    get anuncis_create_url
    assert_response :success
  end

  test "should get show" do
    get anuncis_show_url
    assert_response :success
  end

  test "should get update" do
    get anuncis_update_url
    assert_response :success
  end

  test "should get destroy" do
    get anuncis_destroy_url
    assert_response :success
  end

end
