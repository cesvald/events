class AddTentsHouseAndBedsRecords < ActiveRecord::Migration[4.2]
  def up
    location = Location.where(name:'Ashram').first
    if location
      house = location.houses.create(name: 'Carpas', open_stay: true)
      for room in 1..20
        room = house.rooms.create(name: room.to_s)
        for bed in 1..3
          room.beds.create(number: bed)
        end
      end
    end
  end
  
  def down
    House.where(name:'Carpas').destroy_all
  end
end
