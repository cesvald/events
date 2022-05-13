# == Schema Information
#
# Table name: token_controls
#
#  id         :integer          not null, primary key
#  guest_id   :integer
#  auth_token :text
#  state      :string           default("pending")
#
class TokenControl < ApplicationRecord
  
  belongs_to :guest
  
end
