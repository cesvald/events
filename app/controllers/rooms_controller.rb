class RoomsController < BaseHostingController

  private

    def room_params
      params.require(:room).permit(:name, :house_id)
    end
end

