class HostsController < ApplicationController
	inherit_resources
	respond_to :html, :json

	def index
		@hosts = params[:q] ? Host.where( 'name ILIKE :query', {query: "%#{params[:q]}%"} ) : Host.all
		respond_to do |format|
			format.html
			format.json  {render :json => @hosts.map(&:attributes)}
		end
	end

  private

    def host_params
      params.require(:host).permit(:name)
    end
end