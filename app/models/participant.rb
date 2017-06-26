class Participant < ActiveRecord::Base
  
  belongs_to :guest
  
  belongs_to :space
  
  has_one :air_ticket
  has_many :payments
  has_many :stays
  
  scope :by_guest, ->(guest_id) { where( guest_id: guest_id ) }
  scope :by_modality, -> (modality_id) { joins(:space).where('spaces.modality_id = ?', modality_id) }
  scope :by_space, -> (space_id) { where(space_id: space_id) }
  scope :by_confirmed, -> (is_confirmed) {
    if is_confirmed.to_i == 0
      joins('LEFT OUTER JOIN air_tickets ON participants.id = air_tickets.participant_id').joins('LEFT OUTER JOIN payments ON participants.id = payments.participant_id').where('air_tickets.participant_id IS NOT NULL OR payments.participant_id IS NOT NULL')
    elsif is_confirmed.to_i == 1
      joins('LEFT OUTER JOIN air_tickets ON participants.id = air_tickets.participant_id').joins('LEFT OUTER JOIN payments ON participants.id = payments.participant_id').where('air_tickets.participant_id IS NULL AND payments.participant_id IS NULL')
    end
    
  }
  
  delegate :display_stays_total_amount, :display_payments_total_amount, :display_due, to: :decorator
  
  # Using decorators
  def decorator
    @decorator ||= ParticipantDecorator.new(self)
  end
  
  [:given, :refunded, :pending].each do |name|
    define_method "deposit_#{name}" do
			self.deposit_state = "#{name}"
		end
		
		define_method "deposit_#{name}?" do
			self.deposit_state == "#{name}"
		end
  end
    
  def confirmed?
    air_ticket || !payments.empty?
  end
  
  def display_confirmed
    confirmed? ? "Si" : "No"
  end
  
  def to_s
    "#{guest} - #{space}"
  end
  
  def stays_total_amount
    stays.sum("amount * date_part('day', age(end_at, start_at))")
  end
  
  def payments_total_amount
    payments.sum("amount")
  end
  
  def due
    space.amount + stays_total_amount - payments_total_amount
  end
  
  def modality
    space.modality
  end
  
  def next_deposit_state_action
    if deposit_pending?
      return 'Deposito Abonado'
    elsif deposit_given?
      return 'Deposito Reembolsado'
    elsif deposit_refunded?
      return 'Reiniciar a Pendiente'
    end
  end
  
  def next_deposit_state
    if deposit_pending?
      deposit_given
    elsif deposit_given?
      deposit_refunded
    elsif deposit_refunded?
      deposit_pending
    end
  end
end
