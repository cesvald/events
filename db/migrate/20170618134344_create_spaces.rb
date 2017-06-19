class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.belongs_to :modality, index: true, foreign_key: true
      t.belongs_to :place, index: true, foreign_key: true
      t.decimal :amount, default: 0

      t.timestamps null: false
    end
  end
end
