class Bed < ActiveRecord::Base
  belongs_to :room
  has_many :bookings
  has_many :hosts, through: :bookings
end
