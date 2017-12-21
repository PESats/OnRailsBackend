require 'test_helper'

class EvaluationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Evaluations must have no nil user" do
    anun = correct_anunci
    vali = Evaluation.new(score: 12, user: nil, anunci: anun)
    assert_not vali.save
  end

  test "Evaluations must have no nil anunci" do    
    user2 = correct_user2      
    vali = Evaluation.new(score: 12, user: user2, anunci: nil)
    assert_not vali.save
  end

  test "Evaluation must not have negative score" do
    user2 = correct_user2
    anun = correct_anunci
    vali = Evaluation.new(score: -12, user: user2, anunci: anun)
    assert_not vali.save
  end

  test "Evaluation score must not be greater than 5" do
    user2 = correct_user2
    anun = correct_anunci
    vali = Evaluation.new(score: 12, user: user2, anunci: anun)
    assert_not vali.save
  end

  test "Evaluation score must be an integer" do
    user2 = correct_user2
    anun = correct_anunci
    vali = Evaluation.new(score: 4.5, user: user2, anunci: anun)
    assert_not vali.save
  end
end
