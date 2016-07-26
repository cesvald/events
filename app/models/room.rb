class Room < ActiveRecord::Base
  belongs_to :house
  has_many :beds
end
