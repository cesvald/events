class House < ActiveRecord::Base
  belongs_to :location
  has_many :rooms
  mount_uploader :sketch, SketchUploader
end
