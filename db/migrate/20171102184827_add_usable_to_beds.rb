class AddUsableToBeds < ActiveRecord::Migration[4.2]
  def change
    add_column :beds, :usable, :boolean, default: true
  end
end
