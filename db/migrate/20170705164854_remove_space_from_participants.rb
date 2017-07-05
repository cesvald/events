class RemoveSpaceFromParticipants < ActiveRecord::Migration
  def up
    remove_column :participants, :space_id, :integer
  end
  
  def down
    add_column :participants, :space_id, :integer
    Participant.all.each do |participant|
      participant.space = participant.spaces.first
      participant.save
    end
  end
end
