class CompositionDecorator < Draper::Decorator
  decorates :composition
  include Draper::LazyHelpers
  
  def display_discount
    number_to_currency source.discount, unit: 'USD', precision: 2, delimiter: '.'
  end
end