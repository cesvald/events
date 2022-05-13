class AddDeletedAttoAllTables < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :deleted_at, :datetime
    add_column :modalities, :deleted_at, :datetime
    add_column :places, :deleted_at, :datetime
    add_column :spaces, :deleted_at, :datetime
    add_column :participants, :deleted_at, :datetime
    add_column :participant_spaces, :deleted_at, :datetime
    add_column :air_tickets, :deleted_at, :datetime
    add_column :stays, :deleted_at, :datetime
    add_column :payments, :deleted_at, :datetime
    add_column :bookings, :deleted_at, :datetime
    add_column :guests, :deleted_at, :datetime
    add_column :beds, :deleted_at, :datetime
    add_column :rooms, :deleted_at, :datetime
    add_column :houses, :deleted_at, :datetime
    add_column :locations, :deleted_at, :datetime
    add_column :historicals, :deleted_at, :datetime
    add_column :change_logs, :deleted_at, :datetime
    add_column :compositions, :deleted_at, :datetime
  end
end
