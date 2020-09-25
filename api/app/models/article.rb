class Article < ApplicationRecord
  # belongs_to :tag
  belongs_to :type
  validates :title, presence: true
  validates :body, presence: true
end
