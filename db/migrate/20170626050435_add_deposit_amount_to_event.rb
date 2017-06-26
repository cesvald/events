class AddDepositAmountToEvent < ActiveRecord::Migration
  def change
    add_column :events, :deposit_amount, :decimal, default: 0
  end
end
