class AddIsComposedToModality < ActiveRecord::Migration
  def change
    add_column :modalities, :is_composed, :boolean, default: false, null: false
  end
end
