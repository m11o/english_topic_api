class Category < ApplicationRecord
  validates :name, presence: true
  validates :url, presence: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])

  has_many :topics, dependent: :destroy
end
