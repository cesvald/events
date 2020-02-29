class CreateChangeLogs < ActiveRecord::Migration[4.2]
  def change
    create_table :change_logs do |t|
      t.text :change, null: false
      t.integer :author_id, references: "users"
      t.integer :reviewer_id, references: "users"
      t.boolean :is_reviewed, default: true
      t.datetime :reviewed_at
      t.references :logable, index: true, polymorphic: true
      
      t.timestamps null: false
    end
  end
end
