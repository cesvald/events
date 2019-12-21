class ChangeLogsController < ApplicationController
  
  inherit_resources
  has_scope :reviewed, :was_reviewed
  has_scope :type, type: :array
  
  protected
    def collection
      get_collection_ivar || set_collection_ivar(end_of_association_chain.page params[:page])
    end
  
end