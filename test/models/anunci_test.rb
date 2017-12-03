require 'test_helper'

class AnunciTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "empty anuncis shall not exists" do
    user = correct_user
    user.save
    anun = user.anuncis.new
    assert_not anun.save
  end

  test "new Anuncis shall have a non-null title" do
    user = correct_user
    user.save
    anun = user.anuncis.new(title: " ")
    assert_not anun.save
  end

  test "new Anuncis shall have its user user_id" do
    user = correct_user
    user.save
    anun = user.anuncis.new(title: "MyTest")
    anun.save
    assert anun.user_id != nil
    assert anun.user_id == user.id
    #assert user.anuncis.count() == 1
  end

  test "new Anuncis shall have Open status by default" do
    user = correct_user
    anun = user.anuncis.new(
      title: "I want Schezuan sauce",
      description: "9 more seasons morty",
      latitude: 7.88,
      longitude: 3.55,
      reward: 20
     )
     anun.save
     assert_equal "open", anun.status
  end

  test "new Anuncis status attribute shall be open " do
    user = correct_user
    anun = user.anuncis.new(
      title: "I want Schezuan sauce",
      description: "9 more seasons morty",
      latitude: 7.88,
      longitude: 3.55,
      reward: 20
     )
     anun.save
     anun.status ="Something different"
     assert_not anun.save

  end




end
