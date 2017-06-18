class BaseEventController < ApplicationController
    inherit_resources
    before_action do
        session[:profile] = "eventer"
    end
end