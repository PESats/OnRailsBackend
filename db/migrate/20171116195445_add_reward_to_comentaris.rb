class AddRewardToComentaris < ActiveRecord::Migration[5.1]
  def change
    add_column :comentaris, :reward, :integer, default: 0
  end
end
