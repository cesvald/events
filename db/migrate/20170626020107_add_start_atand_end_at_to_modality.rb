class AddStartAtandEndAtToModality < ActiveRecord::Migration[4.2]
  def change
    add_column :modalities, :start_at, :datetime
    add_column :modalities, :end_at, :datetime
  end
end
