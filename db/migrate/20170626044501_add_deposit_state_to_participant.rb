class AddDepositStateToParticipant < ActiveRecord::Migration
  def change
    add_column :participants, :deposit_state, :string, default: 'pending'
  end
end
