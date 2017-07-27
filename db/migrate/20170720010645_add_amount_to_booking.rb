class AddAmountToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :amount, :integer
  end
end