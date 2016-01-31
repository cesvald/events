class Bed < ActiveRecord::Base
  belongs_to :room
  has_many :bookings
  has_many :guests, through: :bookings

  scope :available, ->(start_date, end_date) { joins('LEFT JOIN bookings ON bookings.bed_id = beds.id').where("(start_date IS NULL AND end_date IS NULL) OR (start_date < :start_date OR start_date > :end_date) AND (end_date < :start_date AND end_date > :end_date)", {start_date: start_date, end_date: end_date})}

  def occupied?(start_date, end_date)
  	self.bookings.where("(start_date >= :start_date AND start_date <= :end_date) OR (end_date >= :start_date AND end_date <= :end_date)", {start_date: start_date, end_date: end_date}).first
  end
end
