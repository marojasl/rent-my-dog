class Dog < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  validates :name, :breed, :photo, :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch
  pg_search_scope :search_by_breed_name_address,
    against: [ :name, :breed, :address ],
    using: {
      tsearch: { prefix: true }
    }

  include PgSearch
  pg_search_scope :search_rate_range,
    against: [ :rate ],
    using: {
      tsearch: { prefix: true }
    }
end
