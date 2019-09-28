class Profile < ActiveRecord::Base
	
	has_and_belongs_to_many :users
	
	[:eventer, :hoster, :admin, :hoster_ashram, :hoster_morada, :coord_country, :coord_outside, :finance, :doctor, :viewer].each do |name|
		define_singleton_method name do
			Profile.where(name: name).first
		end
	end
	
end