class BookingDecorator < Draper::Decorator
  decorates :booking
  include Draper::LazyHelpers
  
  def display_payments_amount
    number_to_currency source.payments_amount, unit: 'USD', precision: 2, delimiter: '.'
  end
  
  def display_amount
    number_to_currency source.amount, unit: 'USD', precision: 2, delimiter: '.'
  end
  
  def display_total_amount
    number_to_currency source.total_amount, unit: 'USD', precision: 2, delimiter: '.'
  end
  
  def display_detailed_total_amount
    "#{source.days} noches * #{source.display_amount} = #{source.display_total_amount}"
  end

  def display_due
    number_to_currency source.due, unit: 'USD', precision: 2, delimiter: '.'
  end
end
