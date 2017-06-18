class Modality < ActiveRecord::Base
  belongs_to :event
  has_many :participations
  has_many :spaces, through: :participations
end
