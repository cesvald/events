class ParticipantDecorator < Draper::Decorator
  decorates :participant
  include Draper::LazyHelpers
  
  def display_stays_amount
    number_to_currency object.stays_amount, unit: 'USD', precision: 2, delimiter: '.'
  end
  
  def display_payments_amount
    number_to_currency object.payments_amount, unit: 'USD', precision: 2, delimiter: '.'
  end
  
  def display_payments_space
    number_to_currency object.payments_space, unit: 'USD', precision: 2, delimiter: '.'
  end
  
  def display_payments_stay
    number_to_currency object.payments_stay, unit: 'USD', precision: 2, delimiter: '.'
  end
  
  def display_spaces_amount
    number_to_currency object.spaces_amount, unit: 'USD', precision: 2, delimiter: '.'
  end
  
  def display_due_spaces
    number_to_currency object.due_spaces, unit: 'USD', precision: 2, delimiter: '.'
  end
  
  def display_due_spaces
    number_to_currency object.due_spaces, unit: 'USD', precision: 2, delimiter: '.'
  end
  
  def display_due
    number_to_currency object.due, unit: 'USD', precision: 2, delimiter: '.'
  end
  
  def display_stays_dates
    stays_s = ""
    object.stays.order(start_at: :asc).each do |stay|
      stays_s += stay.to_s + " - "
    end
    return stays_s[0..-3]
  end
  
  def display_payments_method
    object.payments.select(:method).distinct.pluck(:method).join(",")
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
