class Topic < ApplicationRecord
  validates :name, presence: true

  belongs_to :category

  scope :random, -> { order('RAND()') }
end
