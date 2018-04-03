class ModalitiesController < BaseEventController
  
  belongs_to :event
  
  def create
    create! { event_modalities_path(@modality.event) }
  end
  
  def new
    gon.places = parent.places
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
      format.html { redirect_to :back }
    end
  end
  
  private

    def modality_params
      params.require(:modality).permit(:name, :event_id, :start_at, :end_at, spaces_attributes: [:id, :place_id, :amount, :_destroy])
    end
end

