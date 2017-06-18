class Participant < ActiveRecord::Base
  belongs_to :guest
  belongs_to :participation
end
