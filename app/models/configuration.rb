# == Schema Information
#
# Table name: configurations
#
#  id    :integer          not null, primary key
#  name  :string
#  value :text
#
class Configuration < ApplicationRecord
		validates_presence_of :name
		
		class << self
			# This method returns the values of the config simulating a Hash, like:
			#   Configuration[:foo]
			# It can also bring Arrays of keys, like:
			#   Configuration[:foo, :bar]
			# ... so you can pass it to a method using *.
			# It is memoized, so it will be correctly cached.
			def [] *keys
				if keys.size == 1
					get keys.shift
				else
					keys.map{|key| get key }
				end
			end
			def []= key, value
				set key, value
			end
			private
	
			def get key
				find_by_name(key).value rescue nil
			end
	
			def set key, value
				begin
					find_by_name(key).update :value, value
				rescue
					create!(name: key, value: value)
				end
				value
			end
		end
	
end
 
