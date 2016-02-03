class Booking < ActiveRecord::Base
  belongs_to :bed
  belongs_to :guest

  validates :bed, :guest, :start_date, :end_date, presence: true
  validate :available
  validate :valid_dates

  scope :by_location, ->(location_id) { joins( bed: [ room: [ house: [ :location ] ] ] ).where('locations.id = :location_id', {location_id: location_id}) }
  scope :by_house, ->(house_id) { joins( bed: [ room: [ :house ] ] ).where('houses.id = :house_id', {house_id: house_id}) }
  scope :by_room, ->(room_id) { joins( bed: [ :room ] ).where('rooms.id = :room_id', {room_id: room_id}) }
  scope :by_bed, ->(bed_id) { where('bed_id = :bed_id', {bed_id: bed_id}) }
  scope :by_guest, ->(guest_id) { where('guest_id = :guest_id', {guest_id: guest_id}) }
  scope :by_start_date, ->(start_date) { where('start_date >= :start_date', {start_date: start_date}) }
  scope :by_end_date, ->(end_date) { where('end_date = :end_date', {end_date: end_date}) }
  scope :between_dates, ->(start_date, end_date) { where('(start_date >= :start_date AND start_date <= :end_date) OR (end_date >= :start_date AND end_date <= :end_date)', {start_date: start_date, end_date: end_date}) }
  
  def available
  	if self.bed
	  	current_booking = self.bed.occupied?(self.start_date, self.end_date, self.id.blank? ? 0 : self.id)
	  	if current_booking
				errors.add(:occupied, "This bed is occupied from #{current_booking.start_date} to #{current_booking.end_date}")
			end
		end
  end

  def valid_dates
    if self.start_date && self.end_date
      if self.end_date < self.start_date
        errors.add(:invalid_dates, "The end date must be after the start date")
      end
    end
  end
end