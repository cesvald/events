class Stay < ActiveRecord::Base
  belongs_to :participant
  belongs_to :space
  attr_accessor :author_id
  
  after_create :add_create_log
  before_destroy :add_destroy_log
  
  scope :after_date, -> (date) {where("start_at > :date OR end_at > :date", date: date)}
  scope :is_reviewed, -> (is_reviewed) {where(is_reviewed: is_reviewed)}
  
  delegate :display_amount, :display_total_amount, :display_detailed_total_amount, to: :decorator
  
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
  
  def when_to_s
    start_at < participant.spaces.last.modality.end_at ? 'Estadía Pre' : 'Estadía Post'
  end
  
  def to_s
    return "#{I18n.l start_at, format: :date } al #{I18n.l end_at, format: :date} en #{place}" unless start_at.nil? || end_at.nil?
  end
  
  def add_create_log
    participant.change_logs.create(change: "creó la estadía #{to_s}", author_id: author_id, is_reviewed: false)
  end
  
  def add_update_log
    participant.change_logs.create(change: "actualizó la estadía  #{to_s}", author_id: author_id, is_reviewed: false)
  end
  
  def add_destroy_log
    participant.spaces.first.modality.event.change_logs.create(change: "eliminó la estadía #{to_s}", author_id: author_id, is_reviewed: false)
  end
  
end
