class CreateConfigurations < ActiveRecord::Migration[4.2]
  def change
    create_table :configurations do |t|
      t.string :name
      t.text :value
    end
  end
end
