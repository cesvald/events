class CreateStays < ActiveRecord::Migration
  def change
    create_table :stays do |t|
      t.belongs_to :participant, index: true, foreign_key: true
      t.belongs_to :space, index: true, foreign_key: true
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps null: false
    end
  end
end
