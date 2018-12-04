class CreateCompositions < ActiveRecord::Migration
  def change
    create_table :compositions do |t|
      t.belongs_to :modality, index: true, foreign_key: false
      t.integer :submodality_id, index: true, foreign_key: false
      t.decimal :discount
    end
  end
end