# == Schema Information
#
# Table name: historicals
#
#  id          :integer          not null, primary key
#  name        :string
#  value       :decimal(, )
#  start_date  :date
#  location_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Historical < ApplicationRecord

  acts_as_paranoid
  
  belongs_to :location, optional: true
end
