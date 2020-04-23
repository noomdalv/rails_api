class User < ApplicationRecord
  has_many :records
  has_many :record_details, through: :records
  before_save { email.downcase! }
  has_secure_password

  validates :name, length: { minimum: 4, maximum: 30 }, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 4 }
end
