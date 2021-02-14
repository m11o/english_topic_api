class TopicHistory < ApplicationRecord
  validates :content, presence: true
  validates :written_at, presence: true

  belongs_to :user
  belongs_to :topic
end
