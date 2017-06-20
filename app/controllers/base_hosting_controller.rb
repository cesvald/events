class BaseHostingController < ApplicationController
    inherit_resources
    before_action do
        session[:profile] = "hoster"
    end
end