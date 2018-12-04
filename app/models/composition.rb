class Composition < ActiveRecord::Base
    belongs_to :modality
    belongs_to :submodality, class_name: 'Modality', foreign_key: :submodality_id
    
    delegate :display_discount, to: :decorator

    # Using decorators
    def decorator
        @decorator ||= CompositionDecorator.new(self)
    end

end