class AddIsComposedToModality < ActiveRecord::Migration[4.2]
  def change
    add_column :modalities, :is_composed, :boolean, default: false, null: false
  end
end
