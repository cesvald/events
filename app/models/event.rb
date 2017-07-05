class Event < ActiveRecord::Base
    has_many :modalities
    
    delegate :display_deposit_amount, to: :decorator

    # Using decorators
    def decorator
        @decorator ||= EventDecorator.new(self)
    end
    
    def participants
        Participant.joins(spaces: :modality).where("modalities.event_id = ?", id).select("DISTINCT(participants.id), participants.guest_id")
    end
    
    def to_s
        name
    end
end