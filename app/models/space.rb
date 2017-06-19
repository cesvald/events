class Space < ActiveRecord::Base
  belongs_to :place
  belongs_to :modality
  
  def to_s
    place.name
  end
  
end
