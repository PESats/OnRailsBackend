require 'test_helper'

class ComentariTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Comments shall have nonempty text" do
    comm = Comentari.new()
    assert_not comm.save
  end
  
  test "Comments shall belong to a user and a post" do
    comm = Comentari.new(text: "GyalYoParty")
    assert_not comm.save
    user = correct_user
    anun = correct_anunci
    comm = user.comentaris.create(text: "Correct Comment", anunci_id: anun.id)
    assert comm.save
  end
  
  test "Comments shall belong to a user and a post and a non null text" do
    
    user = correct_user
    anun = correct_anunci
    comm = user.comentaris.create(anunci_id: anun.id)
    assert_not comm.save
  end
    
end
