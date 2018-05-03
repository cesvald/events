class AddAmountAsDecimalToBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :amount, :integer
    add_column :bookings, :amount, :decimal
  end
end
