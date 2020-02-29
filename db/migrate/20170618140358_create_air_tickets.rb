class CreateAirTickets < ActiveRecord::Migration[4.2]
  def change
    create_table :air_tickets do |t|
      t.belongs_to :participant, index: true, foreign_key: true
      t.datetime :arrive_at
      t.string :arrive_to
      t.datetime :leave_at
      t.string :leave_from
      t.datetime :estimated_at
      t.timestamps null: false
    end
  end
end
