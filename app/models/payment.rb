class Payment < ActiveRecord::Base
  belongs_to :participant
  belongs_to :payable, :polymorphic => :true
end
