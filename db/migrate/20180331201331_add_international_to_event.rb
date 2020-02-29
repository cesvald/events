class AddInternationalToEvent < ActiveRecord::Migration[4.2]
  def change
    add_column :events, :international, :boolean, default: false
  end
end
