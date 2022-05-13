# == Schema Information
#
# Table name: profiles
#
#  id   :integer          not null, primary key
#  name :string
#
class Profile < ApplicationRecord
	
	has_and_belongs_to_many :users
	
	["hoster", "eventer", "admin", "hoster_ashram", "hoster_morada", "hoster_ashram", "hoster_morada", "coord_country", "coord_outside", "finance", "doctor", "viewer", "coord_eventer"].each do |name|
		define_singleton_method name do
			Profile.where(name: name).first
		end
	end
	
end
