class AddIsInitiateAndAgeToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :is_initiate, :boolean
    add_column :guests, :age, :integer
  end
end
