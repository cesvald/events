class AddIsInitiateAndAgeToGuest < ActiveRecord::Migration[4.2]
  def change
    add_column :guests, :is_initiate, :boolean
    add_column :guests, :age, :integer
  end
end
