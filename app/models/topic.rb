class Topic < ApplicationRecord
  validates :name, presence: true

  belongs_to :category

  has_many :topic_histories

  scope :random, -> { order('RAND()') }
end
