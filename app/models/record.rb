class Record < ApplicationRecord
  belongs_to :user
  has_many :record_details, dependent: :destroy
  default_scope { order('created_at DESC') }
end
