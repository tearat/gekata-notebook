class Article < ApplicationRecord
  belongs_to :tag
  validates :title, presence: true
  validates :body, presence: true
end
