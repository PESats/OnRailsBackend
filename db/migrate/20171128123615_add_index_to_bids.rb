class AddIndexToBids < ActiveRecord::Migration[5.1]
  def change
    add_index :bids, [:anunci_id, :user_id]
  end
end
