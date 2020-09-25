class Tag < ApplicationRecord
  # belongs_to :type
  validates :title, presence: true
end
