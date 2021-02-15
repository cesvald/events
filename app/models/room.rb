class Room < ApplicationRecord
  belongs_to :house
  has_many :beds, :dependent => :destroy
end
