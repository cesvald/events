class EventsController < BaseEventController
  
  custom_actions :resource => [:new_import, :report_composition]
  
  require 'csv'
  
  def create
    create! { events_path }
  end
  
  def update
    update! { events_path }
  end
  
  def import
    @event = Event.find params[:id]
    csv_file = params[:file]
    puts 'INICIO ------------------------:   '
    CSV.foreach(csv_file.path, :headers => true, :col_sep => ';', encoding:'iso-8859-1:utf-8') do |row|
      guest = Guest.where(email: row['email']).first
      if not guest
        guest = Guest.new(email: row['email'])
        puts 'Creando nuevo contacto en importacion con email: ' + row['email']
      end
      guest.name = row['name']
      guest.surname = row['surname']
      guest.age = row['age']
      guest.city = row['city']
      guest.city = row['country']
      guest.city = row['phone_number']
      guest.save
      puts 'Contacto guardado: ' + row['email']
      modality = @event.modalities.where(name: row['modality']).first
      puts 'La modalidad: ' + row['modality'] + ' si fue encontrada'
      space = modality.spaces.joins(:place).where("places.name = ?", row['space']).first
      puts 'El espacio: ' + row['space'] + ' si fue encontrado'
      participant = Participant.create(guest: guest, space: space)
      if participant
        puts 'El participante ' + participant.id.to_s + " se ha importado correctamente"
      else
        puts 'No se pudo importar al participante ' + participant.id.to_s + ' porque ' + participant.errors.full_messages
      end
    end
  end
  
  def report_detail
    @participants = User.participants_by_role(current_user, Event.find(params[:id]))
    @by = params[:by]
    respond_to do |format|
			format.xlsx {
				response.headers['Content-Disposition'] = "attachment; filename=\" #{DateTime.now.strftime('%Y %m %d')}.xlsx\""
			}
			format.html
		end
  end
  
  def report_composition
    @participants = User.participants_by_role(current_user, resource)
    respond_to do |format|
			format.xlsx {
				response.headers['Content-Disposition'] = "attachment; filename=\" #{DateTime.now.strftime('%Y %m %d')}.xlsx\""
			}
			format.html
		end
  end
  
  def report_general
    @event = Event.find params[:id]
    @by = params[:by]
    respond_to do |format|
			format.xlsx {
				response.headers['Content-Disposition'] = "attachment; filename=\"Occupancy of Beds #{@date_for_months.strftime('%Y')}.xlsx\""
			}
			format.html
		end
  end
  
  private
    def event_params
      params.require(:event).permit(:name, :start_at, :end_at, :active, :deposit_amount, :international)
    end
end