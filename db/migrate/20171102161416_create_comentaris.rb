class CreateComentaris < ActiveRecord::Migration[5.1]
  def change
    create_table :comentaris do |t|
      t.text :text
      t.belongs_to :user, foreign_key: true
      t.belongs_to :anunci, foreign_key: true

      t.timestamps
    end
  end
end
