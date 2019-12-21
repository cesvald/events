class ChangeLog < ActiveRecord::Base
    belongs_to :logable, polymorphic: true
    belongs_to :reviewer, class_name: "User", foreign_key: "reviewer_id"
    belongs_to :author, class_name: "User", foreign_key: "author_id"
    
    scope :type, -> (types) {where(logable_type: types)}
    scope :reviewed, -> (reviewed) {where(is_reviewed: reviewed)}
        
    scope :was_reviewed, -> (was_reviewed) {
      if was_reviewed.to_i == 0
        where.not(reviewer_id: nil)
      elsif is_confirmed.to_i == 1
        where(reviewer_id: nil)
      end
    }
    
    def to_s
      "#{author} #{change}"
    end
end