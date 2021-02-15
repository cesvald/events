class AirTicket < ApplicationRecord
    
  belongs_to :participant
  attr_accessor :author_id
  
  after_create :add_create_log
  before_destroy :add_destroy_log
  after_update :add_update_log
  
  def add_create_log
    participant.change_logs.create(change: "creó el boleto aéreo #{to_s}", author_id: author_id, is_reviewed: true)
  end
  
  def add_update_log
    participant.change_logs.create(change: "actualizó el boleto aéreo  #{to_s}", author_id: author_id, is_reviewed: true)
  end
  
  def add_destroy_log
    participant.change_logs.create(change: "eliminó el boleto aéreo #{to_s}", author_id: author_id, is_reviewed: true)
  end
end
