class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings, :primary_key => [:bed_id, :host_id] do |t|
      t.date :start_date, null: false
      t.date :end_date, null: true
      t.belongs_to :bed, index: true, foreign_key: true, null: false
      t.belongs_to :host, index: true, foreign_key: true, null: false
      t.index [:start_date, :end_date]
      t.timestamps null: false
    end
  end
end