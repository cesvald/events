class Bookings < ActiveRecord::Migration
  def change
     add_column :bookings, :account, :number, default: 0
  end
end
