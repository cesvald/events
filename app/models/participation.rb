class Participation < ActiveRecord::Base
  belongs_to :space
  belongs_to :modality
  
  def to_s
    "#{modality} en #{space}"
  end
end
