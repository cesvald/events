class Space < ActiveRecord::Base
  belongs_to :place
  belongs_to :modality
  
  has_many :participant_spaces, dependent: :delete_all
  
  scope :by_event, -> (event) { joins(:modality).where('modalities.event_id = ?', event.id) }
  
  delegate :display_modality_space, :display_amount, to: :decorator
  
  # Using decorators
  def decorator
    @decorator ||= SpaceDecorator.new(self)
  end
  
  def to_s
    "#{modality} en #{place.name} (#{amount} USD)"
  end
  
  def to_s_wihtout_amount
    "#{modality} en #{place.name}"
  end
end
