class AddIsActiveToSpace < ActiveRecord::Migration
  def change
    add_column :spaces, :is_active, :boolean, default:true, null: false
  end
end
