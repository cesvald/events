class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :start_date, null: false
      t.date :end_date, null: true
      t.belongs_to :bed, index: true, foreign_key: true, null: false
      t.belongs_to :guest, index: true, foreign_key: true, null: false
      t.index [:start_date, :end_date]
      t.timestamps null: false
    end
  end
end