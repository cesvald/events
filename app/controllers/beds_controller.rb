class BedsController < InheritedResources::Base

  private

    def bed_params
      params.require(:bed).permit(:number, :room_id)
    end
end

