class AddDepositAmountToEvent < ActiveRecord::Migration[4.2]
  def change
    add_column :events, :deposit_amount, :decimal, default: 0
  end
end
