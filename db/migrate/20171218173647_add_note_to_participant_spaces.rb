class AddNoteToParticipantSpaces < ActiveRecord::Migration
  def change
    add_column :participant_spaces, :note, :string
  end
end
