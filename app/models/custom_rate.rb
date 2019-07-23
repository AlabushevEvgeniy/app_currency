class CustomRate < ApplicationRecord
  # validates_presence_of :custom_value, scope: %i[date]
  validates :value, :date, presence: true

end
