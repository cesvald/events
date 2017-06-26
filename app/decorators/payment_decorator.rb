class PaymentDecorator < Draper::Decorator
  decorates :stay
  include Draper::LazyHelpers
  
  def display_amount
    number_to_currency source.amount, unit: 'USD', precision: 0, delimiter: '.'
  end

end
