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
    
    def spaces_amount
        Space.joins([:participants, :modality]).where("modalities.event_id = ?").sum("spaces.amount")
    end
    
    def stays_amount
        Space.joins(participants: :stays).joins(:modality).where("modalities.event_id = ?").sum("stays.amount * date_part('day', age(stays.end_at, stays.start_at))")
    end
    
    def payments_spaces
        Space.joins(participants: :payments).joins(:modality).where("modalities.event_id = ?").where("payments.reason = ?", "Evento").sum("payments.amount")
    end
    
    def payments_stays
        Space.joins(participants: :payments).joins(:modality).where("modalities.event_id = ?").where("payments.reason = ?", "Estadia").sum("payments.amount")
    end
    
    def due_spaces
        payments_spaces - spaces_amount
    end
    
    def due_stays
        payments_stays - stays_amount
    end
end