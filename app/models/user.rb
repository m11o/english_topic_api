class User < ApplicationRecord
  validates :mac_address, presence: true

  has_many :topic_histories
end
