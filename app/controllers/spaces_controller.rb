class SpacesController < BaseEventController
  
  belongs_to :event, optional: true
  
  def create
    create! { event_spaces_path(@space.event) }
  end
  
  def update
    update! { event_spaces_path(@space.event) }
  end
  
  def destroy
    destroy! do |format|
      format.html { redirect_to :back }
    end
  end
  
  private

    def space_params
      params.require(:space).permit(:event_id, :place_id, :amount)
    end
end