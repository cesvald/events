class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :name, null: false
      t.belongs_to :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
