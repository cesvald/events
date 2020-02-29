class CreateStays < ActiveRecord::Migration[4.2]
  def change
    create_table :stays do |t|
      t.belongs_to :participant, index: true, foreign_key: true
      t.belongs_to :place, index: true, foreign_key: true
      
      t.datetime :start_at
      t.datetime :end_at
      t.decimal :amount
      
      t.timestamps null: false
    end
  end
end
