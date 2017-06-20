class ParticipantDecorator < Draper::Decorator
  decorates :participant
  include Draper::LazyHelpers
  
  def display_stays_total_amount
    number_to_currency source.stays_total_amount, unit: 'USD', precision: 0, delimiter: '.'
  end
  
  def display_payments_total_amount
    number_to_currency source.payments_total_amount, unit: 'USD', precision: 0, delimiter: '.'
  end
  
  def display_due
    number_to_currency source.due, unit: 'USD', precision: 0, delimiter: '.'
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
