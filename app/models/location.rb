class Location < ApplicationRecord
	  validates :name, uniqueness: true, presence: true
	  has_many :houses, :dependent => :destroy
end
