class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.belongs_to :participant, index: true, foreign_key: true
      t.datetime :paid_at
      t.decimal :amount
      t.text :description

      t.timestamps null: false
    end
  end
end
