class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.belongs_to :event, index: true, foreign_key: true
      t.belongs_to :place, index: true, foreign_key: true
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
