class AddUsableToBeds < ActiveRecord::Migration
  def change
    add_column :beds, :usable, :boolean, default: true
  end
end
