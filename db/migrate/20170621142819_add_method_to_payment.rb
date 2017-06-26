class AddMethodToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :method, :string
  end
end
