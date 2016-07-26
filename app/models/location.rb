class Location < ActiveRecord::Base
	  validates :name, uniqueness: true
	  has_many :houses
end
