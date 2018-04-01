class AddInternationalToEvent < ActiveRecord::Migration
  def change
    add_column :events, :international, :boolean, default: false
  end
end
