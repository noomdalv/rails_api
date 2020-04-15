class User < ApplicationRecord
  has_many :records
  has_many :activities, through: :records
  before_save { email.downcase! }
  has_secure_password

  validates :name, length: { minimum: 4, maximum: 30 }, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
