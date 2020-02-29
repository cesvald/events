class CreateRooms < ActiveRecord::Migration[4.2]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.belongs_to :house, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
