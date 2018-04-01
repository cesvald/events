class Place < ActiveRecord::Base
    
    has_many :spaces
    
    def to_s
        name
    end
end
