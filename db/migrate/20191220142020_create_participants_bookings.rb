class CreateParticipantsBookings < ActiveRecord::Migration
  def change
    create_table :participants_bookings, id: false do |t|
      t.references :participant, index: true, foreign_key: true
      t.references :booking, index: true, foreign_key: true
    end
  end
end
