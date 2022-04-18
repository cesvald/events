class Location < ApplicationRecord
	  validates :name, uniqueness: true, presence: true
	  has_many :houses, :dependent => :destroy
		has_many :historicals
end
