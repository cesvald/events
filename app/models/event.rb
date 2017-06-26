class Event < ActiveRecord::Base
    has_many :modalities
    
    delegate :display_deposit_amount, to: :decorator

    # Using decorators
    def decorator
        @decorator ||= EventDecorator.new(self)
    end
    
    def participants
        Participant.joins(space: :modality).where("modalities.event_id = ?", id)
    end
    
    def to_s
        name
    end
end
