require 'test_helper'

class ComentariTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Comments shall have nonempty name" do
    comm = Comentari.new()
    assert_not comm.save
  end
end
