class ChangeLogsController < ApplicationController
  
  inherit_resources
  has_scope :reviewed, :was_reviewed
  has_scope :type, type: :array
  has_scope :created_at, using: %i[started_at finished_at], type: :hash
  
  respond_to :js, :only => :index
  
  def index
    index! do |format|
      format.html
      format.js {render layout: false, content_type: 'text/javascript'}
    end
  end
  
  def update
    update! {request.referer + "#changes"}
    if change_log_params.has_key?(:is_reviewed)
      ChangeLog.create(change_log_params.merge(change: "revisó el cambio con id #{resource.id}")) if change_log_params[:is_reviewed] == "true"
      ChangeLog.create(change_log_params.merge(change: "marcó como pendiente de revisión el cambio con id #{resource.id}")) if change_log_params[:is_reviewed] == "false"
    end
  end
  
  def change_log_params
    params.require(:change_log).permit(:is_reviewed, :reviewed_at, :reviewer_id)
  end
  
  protected
    def collection
      get_collection_ivar || set_collection_ivar(end_of_association_chain.page(params[:page]))
    end
  
end