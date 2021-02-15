class ModalitiesController < BaseEventController
  
  belongs_to :event
  
  def create
    create! { event_modalities_path(@modality.event) }
  end
  
  def new
    @modality = Modality.new
    gon.places = parent.places
    parent.places.each do |place|
      @modality.spaces.build(place: place)
    end
    new!
  end
  
  def edit
    gon.places = parent.places
    edit!
  end
  
  def update
    update! { event_modalities_path(@modality.event) }
  end
  
  def destroy
    destroy! do |format|
      format.html { redirect_back(fallback_location: root_path) }
    end
  end
  
  def admin_modalities
    @modality = resource
    @single_modalities = parent.modalities.composed(false)
  end
  
  def assign_modality
    submodality = Modality.find(params[:submodality_id])
    composition = resource.compositions.create!(submodality: submodality, discount: params[:discount])
    resource.add_discount(composition)
    redirect_back(fallback_location: root_path)
  end
  
  def remove_modality
    if Modality.joins(spaces: :participants).where('modalities.id = ?', params[:modality_id]).any?
      flash[:failure] = "La modalidad no se puede eliminar porque hay participantes que la tienen asignada."
    else
      composition = resource.compositions.where(modality_id: params[:submodality_id]).first
      resource.remove_discount(composition)
      resource.compositions.destroy(composition)
    end
    
    redirect_back(fallback_location: root_path)
  end
  
  private

    def modality_params
      params.require(:modality).permit(:name, :event_id, :start_at, :end_at, :is_composed, spaces_attributes: [:id, :place_id, :amount, :is_active, :_destroy])
    end
end

