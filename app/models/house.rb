class House < ApplicationRecord
  belongs_to :location
  has_many :rooms, :dependent => :destroy
  mount_uploader :sketch, SketchUploader
  
  def open_stay?
    open_stay
  end
end