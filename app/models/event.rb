class Event < ActiveRecord::Base
    has_many :modalities
    
    def participants
        Participant.joins(space: :modality).where("modalities.event_id = ?", id)
    end
end
