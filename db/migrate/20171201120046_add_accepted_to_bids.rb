class AddAcceptedToBids < ActiveRecord::Migration[5.1]
  def change
    add_column :bids, :accepted, :boolean, default: false
  end
end
