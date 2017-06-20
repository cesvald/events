class Stay < ActiveRecord::Base
  belongs_to :participants
  belongs_to :space
  
  delegate :display_amount, :display_total_amount, to: :decorator

  # Using decorators
  def decorator
    @decorator ||= StayDecorator.new(self)
  end
  
  def days
    ((end_at - start_at) / 1.day).to_i
  end
  
  def total_amount
    days * amount
  end
  
  def display_detailed_total_amount
    "#{days} días * #{display_amount} = #{display_total_amount}"
  end
  
  def trim num
    i, f = num.to_i, num.to_f
    i == f ? i : f
  end
end
