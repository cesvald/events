class SpaceDecorator < Draper::Decorator
  
  decorates :space
  include Draper::LazyHelpers
  
  def display_amount
    number_to_currency source.amount, unit: 'USD', precision: 2, delimiter: '.'
  end
  
  def display_modality_space
    "Modalidad #{source.modality} en #{source.place}"
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
