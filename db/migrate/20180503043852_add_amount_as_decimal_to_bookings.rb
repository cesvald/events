class AddAmountAsDecimalToBookings < ActiveRecord::Migration[4.2]
  def change
    remove_column :bookings, :amount, :integer
    add_column :bookings, :amount, :decimal
  end
end
