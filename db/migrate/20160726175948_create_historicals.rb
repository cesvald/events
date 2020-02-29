class CreateHistoricals < ActiveRecord::Migration[4.2]
  def change
    create_table :historicals do |t|
      t.string :name
      t.decimal :value
      t.date :start_date
      t.references :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
