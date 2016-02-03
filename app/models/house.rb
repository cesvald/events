class House < ActiveRecord::Base
  belongs_to :location

  mount_uploader :sketch, SketchUploader
end
