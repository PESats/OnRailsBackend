class SetBidsIndexToUnique < ActiveRecord::Migration[5.1]
  def change
    remove_index :bids , [:anunci_id, :user_id]
    add_index :bids, [:anunci_id, :user_id] , unique: true
  end
end
