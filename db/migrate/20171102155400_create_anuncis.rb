class CreateAnuncis < ActiveRecord::Migration[5.1]
  def change
    create_table :anuncis do |t|
      t.string :title
      t.text :description
      t.decimal :latitude
      t.decimal :longitude
      t.integer :reward
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
