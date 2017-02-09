class AddOpenStayToHouses < ActiveRecord::Migration
  def up
    add_column :houses, :open_stay, :boolean, default: false
  end

  def down
    remove_column :houses, :open_stay
  end
end
