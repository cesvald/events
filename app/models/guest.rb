class Guest < ActiveRecord::Base
	has_many :bookings
	has_many :beds, through: :bookings
	
	scope :by_name, ->(name) { where( 'name ILIKE :name', {name: "%#{name}%"} ) }
	scope :by_surname, ->(surname) { where( 'surname ILIKE :surname', {surname: "%#{surname}%"} ) }
	scope :by_email, ->(email) { where( 'email ILIKE :email', {email: "%#{email}%"} ) }
	
	validates_uniqueness_of :email
	
	def full_name
		"#{name} #{surname}"
	end
	
	def to_s
		"#{name} #{surname} (#{email})"
	end
end