class EventDecorator < Draper::Decorator
  decorates :event
  include Draper::LazyHelpers
  
  def display_deposit_amount
    number_to_currency source.deposit_amount, unit: 'USD', precision: 0, delimiter: '.'
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
