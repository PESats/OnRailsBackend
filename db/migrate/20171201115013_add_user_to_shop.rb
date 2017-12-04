class AddUserToShop < ActiveRecord::Migration[5.1]
  def change
    add_reference :shops, :user, index: true
  end
end
