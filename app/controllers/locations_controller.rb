class LocationsController < BaseHostingController

	inherit_resources
  actions :index, :create, :update, :destroy, :show, :new
  skip_before_action :authenticate_user, only: :calendar
  def calendar
    respond_to do |format|
      @locations = Location.includes(houses: [ rooms: [ :beds ] ]).all.order('houses.name ASC')
  		params[:year] = Time.now.year if params[:year].blank?
  		params[:month] = Time.now.month if params[:month].blank?
  
  		@start_date = Date.new(params[:year].to_i, params[:month].to_i, 1)
  		@end_date = Date.new(params[:year].to_i, params[:month].to_i, -1)
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

  
end

