class ParticipantSpace < ActiveRecord::Base
  
  belongs_to :participant
  belongs_to :space
  
  attr_accessor :author_id
  
  after_create :add_create_log
  before_destroy :add_destroy_log
  after_update :add_update_log
  
  def add_create_log
    is_reviewed = participant.confirmed? ? false : true
    participant.change_logs.create(change: "creó la modalidad #{to_s}", author_id: author_id, is_reviewed: is_reviewed)
  end
  
  def add_update_log
    is_reviewed = participant.confirmed? ? false : true
    participant.change_logs.create(change: "actualizó la modalidad  #{to_s}", author_id: author_id, is_reviewed: is_reviewed)
  end
  
  def add_destroy_log
    is_reviewed = participant.confirmed? ? false : true
    participant.change_logs.create(change: "eliminó la modalidad #{to_s}", author_id: author_id, is_reviewed: is_reviewed)
  end
    
  def to_s
    "#{space.to_s_wihtout_amount}"
  end
end