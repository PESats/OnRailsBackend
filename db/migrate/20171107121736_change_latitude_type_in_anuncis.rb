class ChangeLatitudeTypeInAnuncis < ActiveRecord::Migration[5.1]
  def up
    change_column :anuncis, :latitude, :float
  end

  def down
    change_column :anuncis, :latitude, :decimal
  end
end
