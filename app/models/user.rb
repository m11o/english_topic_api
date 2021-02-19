class User < ApplicationRecord
  validates :code, presence: true

  has_many :topic_histories, dependent: :destroy

  before_validation :generate_code

  private

  def generate_code
    return if code.present?

    self.code = SecureRandom.uuid
  end
end
