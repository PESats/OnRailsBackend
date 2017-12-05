class AddCouponsToShops < ActiveRecord::Migration[5.1]
  def change
    add_reference :coupons, :shop, index: true
  end
end
