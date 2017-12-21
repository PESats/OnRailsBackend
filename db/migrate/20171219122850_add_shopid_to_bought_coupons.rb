class AddShopidToBoughtCoupons < ActiveRecord::Migration[5.1]
  def change
    add_column :bought_coupons, :shop_id, :integer
  end
end
