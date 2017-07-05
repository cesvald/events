class BedObserver < ActiveRecord::Observer
	
	def after_create(bed)
		if not bed.room.house.open_stay?
			current_total_beds = Historical.where("location_id = :location_id AND start_date <= :start_date", {location_id: bed.room.house.location.id, start_date: Date.today}).last
			if current_total_beds and current_total_beds.start_date == Date.today.beginning_of_month
				current_total_beds.value += 1
				current_total_beds.save
			else
				Historical.create(location: bed.room.house.location, start_date: Date.today.beginning_of_month, name: "total_beds", value: current_total_beds.value + 1)
			end
		end
	end
	
	def after_destroy(bed)
		if not bed.room.house.open_stay?
			current_total_beds = Historical.where("location_id = :location_id AND start_date <= :start_date", {location_id: bed.room.house.location.id, start_date: Date.today}).last
			if current_total_beds.start_date == Date.today.beginning_of_month
				current_total_beds.value -= 1
				current_total_beds.save
			else
				Historical.create(location: bed.room.house.location, start_date: Date.today.beginning_of_month, name: "total_beds", value: current_total_beds.value - 1)
			end
		end
	end
	
end