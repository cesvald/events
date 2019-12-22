class ChangeLogsController < ApplicationController
  
  inherit_resources
  has_scope :reviewed, :was_reviewed
  has_scope :type, type: :array
  
  def update
    update! {request.referer + "#changes"}
  end
  
  def change_log_params
    params.require(:change_log).permit(:is_reviewed, :reviewed_at, :reviewer_id)
  end
  
  protected
    def collection
      get_collection_ivar || set_collection_ivar(end_of_association_chain.page params[:page])
    end
  
end