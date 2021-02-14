class Category < ApplicationRecord
  validates :name, presence: true
  validates :url, presence: true, format: URI.regexp(%w[http https])

  has_many :topics, dependent: :destroy
end
