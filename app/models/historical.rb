class Historical < ApplicationRecord
  belongs_to :location, optional: true
end
