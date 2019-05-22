class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dog
  has_one :payment, dependent: :destroy

  validates :start_date, :end_date, presence: true
end
