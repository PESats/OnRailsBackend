class CreateBoughtCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :bought_coupons do |t|
      t.string :title
      t.text :description
      t.integer :discount
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
