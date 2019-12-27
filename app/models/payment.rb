class Payment < ActiveRecord::Base
  belongs_to :participant
  belongs_to :payable
  attr_accessor :author_id
  
  after_create :add_create_log
  before_destroy :add_destroy_log
  after_update :add_update_log
  
  delegate :display_amount, to: :decorator
  
  def decorator
    @decorator ||= StayDecorator.new(self)
  end
  
  def add_create_log
    is_reviewed = participant.payments.count == 1 && participant.air_ticket.nil? ? false : true
    participant.change_logs.create(change: "creó el pago #{to_s}", author_id: author_id, is_reviewed: is_reviewed)
  end
  
  def add_update_log
    participant.change_logs.create(change: "actualizó el pago  #{to_s}", author_id: author_id)
  end
  
  def add_destroy_log
    is_reviewed = participant.payments.count == 1 && participant.air_ticket.nil? ? false : true
    participant.change_logs.create(change: "eliminó el pago #{to_s}", author_id: author_id, is_reviewed: is_reviewed)
  end
  
  def to_s
    "#{display_amount} el #{I18n.l paid_at}"
  end
end
