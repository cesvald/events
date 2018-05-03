class Payment < ActiveRecord::Base
  belongs_to :participant
  belongs_to :payable
  
  delegate :display_amount, to: :decorator
  
  def decorator
    @decorator ||= StayDecorator.new(self)
  end
  
end
