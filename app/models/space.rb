class Space < ApplicationRecord
  belongs_to :place
  belongs_to :modality
  
  has_many :participant_spaces, dependent: :delete_all
  has_many :participants, through: :participant_spaces
  
  scope :by_event, -> (event) { joins(:modality).where('modalities.event_id = ?', event.id) }
  scope :order_by_name, -> { joins(:modality).order('modalities.name ASC') }
  scope :composed, ->(composed) { eager_load(:modality).where('modalities.is_composed = :composed', {composed: composed}) }
  
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
