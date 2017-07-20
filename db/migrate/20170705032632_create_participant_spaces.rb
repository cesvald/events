class CreateParticipantSpaces < ActiveRecord::Migration
  def up
    create_table :participant_spaces do |t|
      t.belongs_to :participant, index: true, foreign_key: true
      t.belongs_to :space, index: true, foreign_key: true
    end
    
    Participant.all.each do |participant|
      participant.spaces << participant.space if participant.space
    end
  end
  
  def down
    drop_table :participant_spaces
  end
end