class ParticipantSpace < ActiveRecord::Base
  
  belongs_to :participant
  belongs_to :space
  
 end