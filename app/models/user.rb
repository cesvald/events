class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :registerable
  
  has_and_belongs_to_many :profiles
  
  Profile.all.pluck(:name).each do |name|
    define_method "#{name}?" do
			not profiles.where(name: name).empty?
		end
  end
  
  def country_name
		country_name = ISO3166::Country[country]
    country_name.translations[I18n.locale.to_s] || country_name.name
	end
	
	def to_s
	  "#{name} #{surname}"
	end
end