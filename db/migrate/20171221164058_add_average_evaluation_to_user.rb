class AddAverageEvaluationToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :average_evaluation, :float, default: 0.0
  end
end
