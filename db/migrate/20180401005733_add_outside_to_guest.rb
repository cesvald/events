class AddOutsideToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :outside, :boolean, default: false
  end
end
