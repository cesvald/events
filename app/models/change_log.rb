class ChangeLog < ActiveRecord::Base
  belongs_to :logable, polymorphic: true
  belongs_to :reviewer, class_name: "User", foreign_key: "reviewer_id"
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  
  scope :type, -> (types) {where(logable_type: types)}
  scope :reviewed, -> (reviewed) {where(is_reviewed: reviewed)}
  scope :created_at, -> (started_at, finished_at) {where('created_at >= :started_at AND created_at <= :finished_at', {started_at: started_at, finished_at: finished_at})}
  
  scope :was_reviewed, -> (was_reviewed) {
    if was_reviewed.to_i == 1
      where.not(reviewer_id: nil)
    elsif was_reviewed.to_i == 0
      where(reviewer_id: nil)
    end
  }
  
  def to_s
    "#{author} #{change}"
  end
end