class StayDecorator < Draper::Decorator
  decorates :stay
  include Draper::LazyHelpers
  
  def display_amount
    number_to_currency object.amount, unit: 'USD', precision: 2, delimiter: '.'
  end
  
  def display_total_amount
    number_to_currency object.total_amount, unit: 'USD', precision: 2, delimiter: '.'
  end
  
  def display_detailed_total_amount
    "#{object.days} noches * #{object.display_amount} = #{object.display_total_amount}"
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
