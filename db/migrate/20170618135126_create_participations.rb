class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.belongs_to :space, index: true, foreign_key: true
      t.belongs_to :modality, index: true, foreign_key: true
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
