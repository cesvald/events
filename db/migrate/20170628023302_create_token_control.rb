class CreateTokenControl < ActiveRecord::Migration[4.2]
  def change
    create_table :token_controls do |t|
      t.belongs_to :guest, index: true, foreign_key: true
      t.text :auth_token
      t.string :state, default: 'pending'
    end
  end
end
