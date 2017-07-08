class Participant < ActiveRecord::Base
  
  belongs_to :guest
  
  has_many :participant_spaces, dependent: :delete_all
  accepts_nested_attributes_for :participant_spaces, :allow_destroy => true
  
  has_many :spaces, through: :participant_spaces
  
  has_one :air_ticket, dependent: :delete
  has_many :payments, dependent: :delete_all
  
  has_many :stays, dependent: :delete_all
  
  scope :by_modality, ->(modality_id) { joins(:spaces).where('spaces.modality_id = ?', modality_id) }
  scope :by_space, ->(space_id) { where('participant_spaces.space_id = ?', space_id) }
  scope :by_guest, ->(guest_id) { where( guest_id: guest_id ) }
  scope :by_confirmed, -> (is_confirmed) {
    if is_confirmed.to_i == 0
      joins('LEFT OUTER JOIN air_tickets ON participants.id = air_tickets.participant_id').joins('LEFT OUTER JOIN payments ON participants.id = payments.participant_id').where('air_tickets.participant_id IS NOT NULL OR payments.participant_id IS NOT NULL')
    elsif is_confirmed.to_i == 1
      joins('LEFT OUTER JOIN air_tickets ON participants.id = air_tickets.participant_id').joins('LEFT OUTER JOIN payments ON participants.id = payments.participant_id').where('air_tickets.participant_id IS NULL AND payments.participant_id IS NULL')
    end
  }
  
  delegate :display_spaces_amount, :display_stays_amount, :display_payments_amount, :display_due_spaces, :display_due_stays, :display_due, to: :decorator
  
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
    "#{guest} - #{spaces_to_s}"
  end
  
  def stays_days
    stays.sum("date_part('day', age(end_at, start_at))").to_i
  end
  
  def stays_amount
    stays.sum("amount * date_part('day', age(end_at, start_at))")
  end
  
  def payments_amount
    payments.sum("amount")
  end
  
  def spaces_amount
    spaces.sum("amount")
  end
  
  def payments_spaces
    payments.where(reason: 'Evento').sum("amount")
  end
  
  def payments_stays
    payments.where(reason: 'Estadia').sum("amount")
  end
  
  def due_spaces
    spaces_amount - payments_spaces
  end
  
  def due_stays
    stays_amount - payments_stays
  end
  
  def due
    due_spaces + due_stays
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

  def spaces_to_s
    to_s = ''
    spaces.each do |space|
      to_s += space.to_s + "<br>"
    end
    to_s.html_safe
  end
end
