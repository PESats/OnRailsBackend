class RenameValidationsTable < ActiveRecord::Migration[5.1]
  def change
    rename_table :validations, :evaluations
  end
end
