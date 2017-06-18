class Space < ActiveRecord::Base
  belongs_to :event
  belongs_to :place
  
  has_many :participations
  has_many :modalities, through: :participations
  
  def to_s
    event.place
  end
end
