class Record < ApplicationRecord
  belongs_to :user
  has_many :record_details
end
