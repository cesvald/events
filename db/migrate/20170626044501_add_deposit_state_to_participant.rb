class AddDepositStateToParticipant < ActiveRecord::Migration[4.2]
  def change
    add_column :participants, :deposit_state, :string, default: 'pending'
  end
end
