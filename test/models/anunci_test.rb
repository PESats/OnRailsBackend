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




end
