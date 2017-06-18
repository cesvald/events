class Event < ActiveRecord::Base
    has_many :participants
    has_many :spaces
    has_many :modalities
end
