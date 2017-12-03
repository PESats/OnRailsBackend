class AddStatusToAnunci < ActiveRecord::Migration[5.1]
  def change
    add_column :anuncis, :status, :string, default: "open"
  end
end
