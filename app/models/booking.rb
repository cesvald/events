class Booking < ActiveRecord::Base
  belongs_to :bed
  belongs_to :host
end
