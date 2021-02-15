class AddIsActiveToSpace < ActiveRecord::Migration[4.2]
  def change
    add_column :spaces, :is_active, :boolean, default:true, null: false
  end
end
