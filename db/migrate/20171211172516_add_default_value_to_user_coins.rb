class AddDefaultValueToUserCoins < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :coins, 42
  end
end
