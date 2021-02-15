class AddOutsideToGuest < ActiveRecord::Migration[4.2]
  def change
    add_column :guests, :outside, :boolean, default: false
  end
end
