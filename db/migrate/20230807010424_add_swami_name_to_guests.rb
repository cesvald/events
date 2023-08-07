class AddSwamiNameToGuests < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :swami_name, :string
  end
end
