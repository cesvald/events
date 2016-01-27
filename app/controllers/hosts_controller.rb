class HostsController < InheritedResources::Base

  private

    def host_params
      params.require(:host).permit(:name)
    end
end

