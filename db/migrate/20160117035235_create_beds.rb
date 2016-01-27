class CreateBeds < ActiveRecord::Migration
  def change
    create_table :beds do |t|
      t.integer :number, null: false
      t.belongs_to :room, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
