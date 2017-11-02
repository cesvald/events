class LocationsController < BaseHostingController

	inherit_resources
  actions :index, :create, :update, :destroy, :show, :new
  skip_before_action :authenticate_user, only: :calendar
  def calendar
    respond_to do |format|
      @locations = Location.includes(houses: [ rooms: [ :beds ] ]).all.order('houses.name ASC')
  		date_params[:year] = Time.now.year if date_params[:year].blank?
  		date_params[:month] = Time.now.month if date_params[:month].blank?
  
  		@start_date = Date.new(date_params[:year].to_i, date_params[:month].to_i, 1)
  		@end_date = Date.new(date_params[:year].to_i, date_params[:month].to_i, -1)
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename=\"Calendar #{@start_date.strftime('%B %Y')}.xlsx\""
      }
      format.html
    end
	end

  private

    def location_params
      params.require(:location).permit(:name)
    end

    def date_params
    	params.require(:date).permit(:year, :month)
    end
end

