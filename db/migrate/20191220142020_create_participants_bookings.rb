class CreateParticipantsBookings < ActiveRecord::Migration[4.2]
  def change
    create_table :participants_bookings, id: false do |t|
      t.references :participant, index: true, foreign_key: true
      t.references :booking, index: true, foreign_key: true
    end
  end
end
