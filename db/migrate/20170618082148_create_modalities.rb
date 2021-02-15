class CreateModalities < ActiveRecord::Migration[4.2]
  def change
    create_table :modalities do |t|
      t.string :name
      t.belongs_to :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end