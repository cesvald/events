class Place < ApplicationRecord
    
    has_many :spaces
    has_and_belongs_to_many :events,  :join_table => :places_events
    
    def to_s
        name
    end
end
