class PlacesController < BaseEventController
  
  belongs_to :event
  
  def index
    @place = Place.new()
    @places = Place.all.order(:name).page(params[:page])
    @own_places = parent.places.order(:name).to_a
  end
  
  def create
    Place.create(place_params)
    redirect_back(fallback_location: root_path)
  end
  
  def update
    @place = Place.find(params[:id])
    @place.update(place_params)
    redirect_to params[:back_url]
  end
  
  def edit
    @place = Place.find(params[:id])
    @back_url = request.referrer
  end
  
  def assign
    parent.places << Place.find(params[:id])
    redirect_back(fallback_location: root_path)
  end
  
  def remove
    place = Place.find(params[:id])
    if parent.modalities.joins(:spaces).where('spaces.place_id = ?', params[:id]).any?
      flash[:failure] = "Hay modalidades del evento que están usando esta categoría y no se puede eliminar"
    else
      parent.places.destroy(place)
    end
    
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    place = Place.find(params[:id])
    if place.spaces.any? 
      flash[:failure] = "Hay Modalidades de otros eventos que están usando esta categoría y no se puede eliminar"
    else
      place.destroy
    end
    redirect_back(fallback_location: root_path)
  end
  
  private

    def place_params
      params.require(:place).permit(:name)
    end
end

