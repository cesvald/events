class Modality < ApplicationRecord
	belongs_to :event
	has_many :spaces, dependent: :delete_all
	
	has_many :compositions, dependent: :delete_all
	has_many :submodalities, through: :compositions
	
	accepts_nested_attributes_for :spaces, :allow_destroy => true
	
	validates_presence_of :name, :start_at, :end_at
	
	scope :composed, ->(composed) { where('is_composed = :composed', {composed: composed}) }
	scope :compositions_by_name, -> { compositions.joins(:submodalities).order("modalities.name ASC") }
	
	def add_discount(composition)
		spaces.each do |space|
			total_space = space.amount
			total_space += (composition.submodality.spaces.where(place: space.place).first.amount - composition.discount)
			space.update_attribute(:amount, total_space)
		end
	end
	
	def remove_discount(composition)
		spaces.each do |space|
			total_space = space.amount
			total_space -= (composition.submodality.spaces.where(place: space.place).first.amount - composition.discount)
			space.update_attribute(:amount, total_space)
		end
	end
	
	def to_s
		name
	end
	
	def spaces_to_s
		spaces.joins(:place).pluck("places.name || ' (' ||  spaces.amount || ' USD)'").join(", ")
	end
end