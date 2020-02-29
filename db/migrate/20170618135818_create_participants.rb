class CreateParticipants < ActiveRecord::Migration[4.2]
  def change
    create_table :participants do |t|
      t.belongs_to :guest, index: true, foreign_key: true
      t.belongs_to :space, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
