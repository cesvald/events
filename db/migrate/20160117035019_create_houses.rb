class CreateHouses < ActiveRecord::Migration[4.2]
  def change
    create_table :houses do |t|
      t.string :name, null: false
      t.string :sketch, null: true
      t.belongs_to :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
