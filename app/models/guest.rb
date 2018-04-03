class Guest < ActiveRecord::Base
	has_many :bookings
	has_many :beds, through: :bookings
	
	scope :by_name, ->(name) { where( 'name ILIKE :name', {name: "%#{name}%"} ) }
	scope :by_surname, ->(surname) { where( 'surname ILIKE :surname', {surname: "%#{surname}%"} ) }
	scope :by_email, ->(email) { where( 'email ILIKE :email', {email: "%#{email}%"} ) }
	scope :by_outside, ->(outside) { where(outside: outside) }
	scope :by_country, ->(country) { where(country: country) }
	validates_uniqueness_of :email
	
	def full_name
		"#{name} #{surname}"
	end
	
	def to_s
		"#{name} #{surname} (#{email})"
	end
	
	def country_name
		if country
			country_name = ISO3166::Country[country]
			if country_name
	    		country_name.translations[I18n.locale.to_s] || country_name.name
	    	end
	    end
	end
	
end