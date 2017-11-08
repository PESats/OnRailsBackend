class ChangeLongitudeTypeInAnuncis < ActiveRecord::Migration[5.1]
  def up
    change_column :anuncis, :longitude, :float
  end

  def down
    change_column :anuncis, :longitude, :decimal
  end
end
