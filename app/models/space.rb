class Space < ActiveRecord::Base
  belongs_to :place
  belongs_to :modality
  
  delegate :display_modality_space, :display_amount, to: :decorator
  
  # Using decorators
  def decorator
    @decorator ||= SpaceDecorator.new(self)
  end
  
  def to_s
    "#{modality} en #{place.name} (#{amount} USD)"
  end
  
end
