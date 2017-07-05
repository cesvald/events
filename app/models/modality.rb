class Modality < ActiveRecord::Base
	belongs_to :event
	has_many :spaces, dependent: :delete_all
	
	accepts_nested_attributes_for :spaces, :allow_destroy => true
	
	validates_presence_of :name, :start_at, :end_at
	
	def to_s
		name
	end
	
	def spaces_to_s
		spaces.joins(:place).pluck("places.name || ' (' ||  spaces.amount || ' USD)'").join(", ")
	end
end