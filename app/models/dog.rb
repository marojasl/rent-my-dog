class Dog < ApplicationRecord
  belongs_to :user
  has_many :bookings
  mount_uploader :photo, PhotoUploader
  validates :name, :breed, :photo, presence: true
end
