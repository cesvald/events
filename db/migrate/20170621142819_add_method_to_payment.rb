class AddMethodToPayment < ActiveRecord::Migration[4.2]
  def change
    add_column :payments, :method, :string
  end
end
