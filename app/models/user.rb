class User < ApplicationRecord
  has_many :rooms
  
  has_one_attached :photo
  has_many :reservations
  has_many :guest_reviews, class_name: "GuestReview", foreign_key: "guest_id"
has_many :host_reviews, class_name: "HostReview", foreign_key: "host_id"


  validates :full_name, :email, presence: true, length: {maximum: 50}, allow_blank: true


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
