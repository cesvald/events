class ChangeLog < ActiveRecord::Base
  belongs_to :logable, polymorphic: true
  belongs_to :reviewer, class_name: "User", foreign_key: "reviewer_id"
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  
  scope :logable_types, -> (types) {where(logable_type: types)}
  scope :logable_ids, -> (ids) {where(logable_id: ids)}
  scope :reviewed, -> (reviewed) {where(is_reviewed: reviewed)}
  scope :created_at, -> (started_at, finished_at) {where('created_at >= :started_at AND created_at <= :finished_at', {started_at: started_at, finished_at: "#{finished_at} 23:59:59"})}
  
  scope :was_reviewed, -> (was_reviewed) {
    if was_reviewed.to_i == 1
      where.not(reviewer_id: nil)
    elsif was_reviewed.to_i == 0
      where(reviewer_id: nil, is_reviewed: false)
    end
  }
  
  scope :type_of, -> (type_of) {
    if type_of.to_i == 0
      where(logable_type: ["Event", "Participant"])
    elsif type_of.to_i == 1
      where(logable_type: "Booking")
    end
  }
  
  def to_s
    "#{author} #{change} #{logable.present? ? " de #{logable.to_s}" : "" }"
  end
end