class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :photo, PhotoUploader
  has_many :dogs
  has_many :bookings
  has_many :receiver_chatrooms, foreign_key: "receiver_id", class_name: "Chatroom"
  has_many :sender_chatrooms, foreign_key: "sender_id", class_name: "Chatroom"
end
