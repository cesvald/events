class AirTicket < ActiveRecord::Base
    
    belongs_to :participant
    
    delegate :display_dates, to: :decorator
end
