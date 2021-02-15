class AddDepositAmountAndStateToBooking < ActiveRecord::Migration[4.2]
  def change
    add_column :bookings, :deposit_amount, :decimal
    add_column :bookings, :deposit_state, :string, default: 'pending'
  end
end
