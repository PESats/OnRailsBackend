class AddDiscountToCoupons < ActiveRecord::Migration[5.1]
  def change
    add_column :coupons, :discount, :integer
  end
end
