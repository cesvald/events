class PlacesController < BaseEventController

  private

    def place_params
      params.require(:place).permit(:name)
    end
end

