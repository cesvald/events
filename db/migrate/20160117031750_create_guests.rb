class CreateGuests < ActiveRecord::Migration[4.2]
  def change
    create_table :guests do |t|
      t.string :name, null: false
      t.string :surname, null: false
      t.string :email, null: false
      t.timestamps null: false
    end
  end
end
