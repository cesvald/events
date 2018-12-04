class Location < ActiveRecord::Base
	  validates :name, uniqueness: true, presence: true
	  has_many :houses, :dependent => :destroy
end
