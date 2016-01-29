class Booking < ActiveRecord::Base
  belongs_to :bed
  belongs_to :host

  validates :bed, :host, :start_date, :end_date, presence: true
  validate :available

  scope :by_location, ->(location_id) { joins( bed: [ room: [ house: [ :location ] ] ] ).where('locations.id = :location_id', {location_id: location_id}) }
  scope :by_house, ->(house_id) { joins( bed: [ room: [ :house ] ] ).where('houses.id = :house_id', {house_id: house_id}) }
  scope :by_room, ->(room_id) { joins( bed: [ :room ] ).where('rooms.id = :room_id', {room_id: room_id}) }
  scope :by_bed, ->(bed_id) { where('bed_id = :bed_id', {bed_id: bed_id}) }
  scope :by_host, ->(host_id) { where('host_id = :host_id', {host_id: host_id}) }
  scope :by_start_date, ->(start_date) { where('start_date >= :start_date', {start_date: start_date}) }
  scope :by_end_date, ->(end_date) { where('end_date = :end_date', {end_date: end_date}) }
  scope :between_dates, ->(start_date, end_date) { where('start_date >= :start_date AND end_date <= :end_date', {start_date: start_date, end_date: end_date}) }

  def available
  	if self.bed
	  	current_booking = self.bed.occupied?(self.start_date, self.end_date)
	  	if current_booking
				errors.add(:occupied, "This bed is occupied from #{current_booking.start_date} to #{current_booking.end_date}")
			end
		end
  end
end