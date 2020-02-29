class AddNoteToParticipantSpaces < ActiveRecord::Migration[4.2]
  def change
    add_column :participant_spaces, :note, :string
  end
end
