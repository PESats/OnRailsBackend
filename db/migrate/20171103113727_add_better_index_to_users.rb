class AddBetterIndexToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_index :users, :email
    add_index :users, [:platform_name, :email]
  end
end
